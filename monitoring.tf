resource "aws_sns_topic" "alerts" {
  name = "${var.project_name}-alerts"

  tags = var.tags
}

resource "aws_sns_topic_subscription" "email_alerts" {
  count     = var.notification_email == "" ? 0 : 1
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = var.notification_email
}

resource "aws_cloudwatch_log_group" "application" {
  name              = "/aws/eks/${var.cluster_name}/application"
  retention_in_days = 30

  tags = var.tags
}

resource "aws_cloudwatch_metric_alarm" "node_cpu_high" {
  alarm_name          = "${var.project_name}-eks-node-cpu-high"
  alarm_description   = "Alerts when average EKS node CPU stays above 80 percent."
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  treat_missing_data  = "notBreaching"

  dimensions = {
    AutoScalingGroupName = module.eks.eks_managed_node_groups["default"].node_group_autoscaling_group_names[0]
  }

  alarm_actions = [aws_sns_topic.alerts.arn]
  ok_actions    = [aws_sns_topic.alerts.arn]

  tags = var.tags
}
