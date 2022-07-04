module "my-ec2-with-volume-and-cloudwatch" {
  source = "./modules-section-7-assignment-1"
}

provider "aws" {
  region = var.region
}