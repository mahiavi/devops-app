output "aws_region" {
  description = "AWS region used by this project."
  value       = var.aws_region
}

output "cluster_name" {
  description = "EKS cluster name."
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "EKS API endpoint."
  value       = module.eks.cluster_endpoint
  sensitive   = true
}

output "ecr_repository_url" {
  description = "Private ECR repository URL for the app image."
  value       = aws_ecr_repository.app.repository_url
}

output "vpc_id" {
  description = "VPC ID created for this project."
  value       = module.vpc.vpc_id
}
