output "lb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.example.dns_name
}

output "target_group_arn" {
  description = "The ARN of the target group"
  value       = aws_lb_target_group.example.arn
}