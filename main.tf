resource "random_string" "cluster" {
  length  = 8
  lower   = false
  special = false

  keepers = {
    name    = var.name
    environ = var.environ
  }
}

resource "aws_ecs_cluster" "this" {
  name = "${random_string.cluster.keepers.name}-${random_string.cluster.keepers.environ}-${random_string.cluster.id}"

  capacity_providers = var.capacity_providers

  dynamic "default_capacity_provider_strategy" {
    for_each = var.capacity_provider_strategies

    content {
      capacity_provider = default_capacity_provider_strategy.value["capacity_provider"]
      weight            = default_capacity_provider_strategy.value["weight"]
      base              = default_capacity_provider_strategy.value["base"]
    }
  }

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = merge(var.tags, {
    "app:name"        = random_string.cluster.keepers.name
    "app:environment" = random_string.cluster.keepers.environ
  })

  lifecycle {
    create_before_destroy = true
  }
}

module "this_alb_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 3.16"

  count = var.create_load_balancer ? 1 : 0

  name        = "${var.name}-${var.environ}-alb"
  description = "Access to the public facing Load Balancer"
  vpc_id      = var.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "https-443-tcp"]

  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules       = ["all-all"]

  tags = merge(var.tags, {
    "app:name"        = var.name
    "app:environment" = var.environ
  })
}

module "this_app_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 3.16"

  name   = "${var.name}-${var.environ}-app"
  vpc_id = var.vpc_id

  ingress_with_self = [{
    rule = "all-all"
  }]

  computed_ingress_with_source_security_group_id = var.create_load_balancer ? [{
    rule                     = "http-80-tcp"
    source_security_group_id = module.this_alb_security_group[0].this_security_group_id
  }] : []

  number_of_computed_ingress_with_source_security_group_id = var.create_load_balancer ? 1 : 0

  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules       = ["all-all"]

  tags = merge(var.tags, {
    "app:name"        = var.name
    "app:environment" = var.environ
  })
}

module "this_alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 5.9"

  count = var.create_load_balancer ? 1 : 0

  name = "${substr(random_string.cluster.keepers.name, 0, 12)}-${substr(random_string.cluster.keepers.environ, 0, 12)}-${random_string.cluster.id}"

  load_balancer_type = "application"

  vpc_id          = var.vpc_id
  subnets         = var.public_subnet_ids
  security_groups = [module.this_alb_security_group[0].this_security_group_id]

  target_groups = [{
    target_type      = "ip"
    backend_protocol = "HTTP"
    backend_port     = 80
  }]

  http_tcp_listeners = [{
    port     = 80
    protocol = "HTTP"
  }]

  tags = merge(var.tags, {
    "app:name"        = random_string.cluster.keepers.name
    "app:environment" = random_string.cluster.keepers.environ
  })
}
