output "cluster_name" {
  value = module.eks.cluster_name
}

output "ecr_repo" {
  value = aws_ecr_repository.webapp.repository_url
}