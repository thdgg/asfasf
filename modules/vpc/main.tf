resource "aws_vpc" "example" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "Example-VPC"
  }
}

resource "aws_subnet" "example" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "example-subnet"
  }
}