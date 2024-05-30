variable "log_group_name" {
  description = "The name of the CloudWatch log group"
  type        = string
}

variable "metric_alarm_name" {
  description = "The name of the CloudWatch metric alarm"
  type        = string
}

variable "autoscaling_group_name" {
  description = "The name of the Auto Scaling group"
  type        = string
}