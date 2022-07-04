resource "aws_instance" "my-ec2" {
  instance_type = var.instance_type
  ami           = var.ami
  ebs_block_device {
    device_name = "/dev/sda1"
  }
}

resource "aws_cloudwatch_metric_alarm" "my-cloudwatch-alarm" {
  alarm_name          = "my-cloudwatch-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"
  namespace           = "AWS/EC2"
  alarm_description   = "This metric monitors EC2 CPU utilization"

  dimensions = {
    "InstanceId" = aws_instance.my-ec2.id
  }
}