variable "ami" {
  type    = string
  default = "ami-0a4722105d5286695"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "availability_zone" {
  type    = string
  default = "eu-west-1b"
}