variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "The IDs of the subnets"
  type        = list(string)
}

variable "instance_type" {
  description = "The instance type for the EC2 instances"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instances"
  type        = string
}

variable "min_size" {
  description = "The minimum number of instances in the Auto Scaling group"
  type        = number
}

variable "max_size" {
  description = "The maximum number of instances in the Auto Scaling group"
  type        = number
}

variable "desired_capacity" {
  description = "The desired number of instances in the Auto Scaling group"
  type        = number
}

variable "target_group_arns" {
  description = "The ARNs of the target groups for the Auto Scaling group"
  type        = list(string)
}