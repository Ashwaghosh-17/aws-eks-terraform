variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "cluster_name" {
  type    = string
  default = "devops-eks"
}

variable "cluster_version" {
  type    = string
  default = "1.33"
}

variable "project_name" {
  type    = string
  default = "microshield-bpo"
}

variable "ecr_repository_name" {
  type    = string
  default = "webapp"
}

variable "allowed_ssh_cidr" {
  type        = string
  description = "CIDR allowed to SSH into the bastion host. Use a narrow office/VPN IP range in production."
  default     = "0.0.0.0/0"
}

variable "key_name" {
  type        = string
  description = "Optional existing EC2 key pair name for SSH access to the bastion."
  default     = null
}

variable "notification_email" {
  type        = string
  description = "Optional email address for SNS alarm notifications."
  default     = ""
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}
