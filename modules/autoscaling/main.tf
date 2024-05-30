resource "aws_autoscaling_group" "example" {
  name                      = "example-asg"
  max_size                  = var.max_size
  min_size                  = var.min_size
  desired_capacity          = var.desired_capacity
  health_check_grace_period = 300
  health_check_type         = "ELB"
  target_group_arns         = var.target_group_arns
  vpc_zone_identifier       = var.subnet_ids

  launch_configuration = aws_launch_configuration.example.name

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
  }
}

resource "aws_launch_configuration" "example" {
  name_prefix     = "example-lc-"
  image_id        = var.ami_id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.example.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World!" > /tmp/hello.txt
              EOF

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "example" {
  name   = "example-asg-security-group"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}