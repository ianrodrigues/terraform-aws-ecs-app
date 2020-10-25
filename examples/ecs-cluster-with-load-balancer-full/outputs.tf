output "my_app_dns" {
  value       = module.my_app.this_lb_dns
  description = "DNS name of the AWS ALB (Application Load Balancer)."
}
