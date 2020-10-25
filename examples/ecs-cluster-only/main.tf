module "my_app" {
  source = "../../"

  name    = var.name
  environ = var.environ

  capacity_providers = ["FARGATE", "FARGATE_SPOT"]

  capacity_provider_strategies = [
    {
      capacity_provider = "FARGATE"
      weight            = 1
      base              = 1
    },
    {
      capacity_provider = "FARGATE_SPOT"
      weight            = 4
      base              = 0
    },
  ]

  enable_container_insights = true
  create_load_balancer      = false

  tags = var.tags
}
