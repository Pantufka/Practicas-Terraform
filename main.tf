provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "Instancia-Terraform" {
  ami           = "ami-098e39bafa7e7303d"
  instance_type = "t2.micro"
  key_name      = "vockey"

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