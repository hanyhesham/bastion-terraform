variable "region" {
  type        = string
  description = "AWS Region."
  default = "us-east-1"
}
variable "ssh_key" {
  type        = string
  description = "EC2 ssh key."
}
variable "ami" {
  type        = string
  description = "EC2 AMI ID."
}
variable "name" {
  type        = string
  description = "EC2 Name."
  default = "Bastion"
}
variable "ec2_type" {
  type        = string
  description = "EC2 Instance Type"
  default = "t2.micro"
}
variable "vpc_id" {
  type        = string
  description = "EC2 Secuity Group"
}
