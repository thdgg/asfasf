resource "aws_lb" "example" {
  name               = "example-lb"
  load_balancer_type = "application"
  subnets            = var.subnet_ids
  security_groups    = [aws_security_group.example.id]
}

resource "aws_lb_listener" "example" {
  load_balancer_arn = aws_lb.example.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.example.arn
  }
}

resource "aws_lb_target_group" "example" {
  name        = "example-tg"
  port        = var.target_group_port
  protocol    = var.target_group_protocol
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    path                = "/"
    healthy_threshold   = 2
    unhealthy_threshold = 10
  }
}

resource "aws_security_group" "example" {
  name   = "example-lb-security-group"
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