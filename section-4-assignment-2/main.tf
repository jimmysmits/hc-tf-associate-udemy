resource "aws_instance" "my-second-ec2" {
  instance_type = var.instance_type
  ami           = var.ami
  tags          = var.tags
}

provider "aws" {
  region = var.region
}