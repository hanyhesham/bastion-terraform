provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_security_group" "bastion_sg" {
  name        = "ssh-bastion-sg"
  description = "Allow SSH connection"
  vpc_id      = var.vpc_id
  ingress {
    description = "SSH from anywhere"
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
  tags = {
    Name = "ssh-bastion-sg"
  }
}

resource "aws_instance" "bastion_ec2" {
  ami           = var.ami
  instance_type = var.ec2_type
  key_name = var.ssh_key
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  tags = {
    Name = var.name
  }
}
