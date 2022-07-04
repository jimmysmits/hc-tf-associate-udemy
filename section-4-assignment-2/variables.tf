variable "ami" {
  type = string
}

variable "region" {
  type = string
}

variable "tags" {
  type = map(any)
}

variable "instance_type" {
  type = string
}