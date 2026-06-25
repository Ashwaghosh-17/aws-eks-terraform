output "cluster_name" {
  value = module.eks.cluster_name
}

output "ecr_repo" {
  value = aws_ecr_repository.webapp.repository_url
}

output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "sns_alert_topic_arn" {
  value = aws_sns_topic.alerts.arn
}

output "aws_load_balancer_controller_role_arn" {
  value = aws_iam_role.aws_load_balancer_controller.arn
}
