output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.example.id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = aws_subnet.example.id
}