provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "Instancia-Terraform" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.test_sg.id]

  tags = {
    Name = "Instancia-Terraform"
  }
}

resource "aws_security_group" "test_sg" {
  name        = "test-terraform-sg"
  description = "SG creado con Terraform"

  ingress {
    from_port   = 22
    to_port     = 22
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