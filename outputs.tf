output "this_cluster" {
  value       = aws_ecs_cluster.this.name
  description = "Name of the ECS cluster."
}

output "this_app_security_group_id" {
  value       = module.this_app_security_group.this_security_group_id
  description = "ID of the application Security Group."
}

output "this_lb_arn" {
  value       = var.create_load_balancer ? module.this_alb[0].this_lb_arn : null
  description = "ARN of the AWS ALB (Application Load Balancer)."
}

output "this_lb_dns" {
  value       = var.create_load_balancer ? module.this_alb[0].this_lb_dns_name : null
  description = "DNS name of the AWS ALB (Application Load Balancer)."
}
