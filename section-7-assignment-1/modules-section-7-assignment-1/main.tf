resource "aws_instance" "my-ec2" {
  instance_type     = var.instance_type
  ami               = var.ami
  availability_zone = var.availability_zone
}

resource "aws_ebs_volume" "my-volume" {
  availability_zone = var.availability_zone
  size              = 40
}

resource "aws_volume_attachment" "my-volume-attachment" {
  device_name = "/dev/sdh"
  instance_id = aws_instance.my-ec2.id
  volume_id   = aws_ebs_volume.my-volume.id
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