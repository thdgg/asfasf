output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = module.ec2.instance_id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = module.vpc.subnet_id
}

output "autoscaling_group_name" {
  description = "The name of the Auto Scaling group"
  value       = module.autoscaling.autoscaling_group_name
}

output "load_balancer_dns_name" {
  description = "The DNS name of the load balancer"
  value       = module.load_balancer.lb_dns_name
}

output "log_group_name" {
  description = "The name of the CloudWatch log group"
  value       = module.monitoring.log_group_name
}

output "target_group_arn" {
  description = "The ARN of the target group"
  value       = module.load_balancer.target_group_arn
}