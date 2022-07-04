resource "aws_instance" "my-first-ec2" {
	ami = "ami-0a4722105d5286695"
	instance_type = "t2.micro"
}