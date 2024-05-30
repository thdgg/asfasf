resource "aws_instance" "example" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  user_data              = <<-EOF
              #!/bin/bash
              echo "Hello, World!" > /tmp/hello.txt
              EOF

  tags = {
    Name = "Example-EC2-Instance"
  }
}