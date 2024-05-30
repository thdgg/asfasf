resource "aws_cloudwatch_log_group" "example" {
  name = var.log_group_name
}

resource "aws_cloudwatch_metric_alarm" "example" {
  alarm_name                = var.metric_alarm_name
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "80"
  alarm_description         = "This metric monitors EC2 CPU utilization"
  insufficient_data_actions = []

  dimensions = {
    AutoScalingGroupName = var.autoscaling_group_name
  }
}