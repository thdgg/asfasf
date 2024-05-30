variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instances"
  type        = string
  default     = "ami-0c2489d63913b3b1f"
}

variable "instance_type" {
  description = "The instance type for the EC2 instances"
  type        = string
  default     = "t2.micro"
}