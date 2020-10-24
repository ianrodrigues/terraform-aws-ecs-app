output "this_cluster" {
  value = aws_ecs_cluster.this.name
}

output "this_app_security_group_id" {
  value = module.this_app_security_group.this_security_group_id
}

output "this_lb_arn" {
  value = module.this_alb.this_lb_arn
}

output "this_lb_dns" {
  value = module.this_alb.this_lb_dns_name
}
