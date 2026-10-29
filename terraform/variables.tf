variable "aws_region" {
  description = "AWS region for the VPC, EKS cluster, and ECR repository."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Short name used in resource names."
  type        = string
  default     = "devops-app"
}

variable "cluster_name" {
  description = "Name of the EKS cluster."
  type        = string
  default     = "devops-app-dev"
}

variable "kubernetes_version" {
  description = "EKS Kubernetes version; verify regional support before applying."
  type        = string
  default     = "1.35"
}

variable "my_ip_cidr" {
  description = "Your current public IPv4 CIDR allowed to access the EKS public API endpoint. Use a single IP with /32."
  type        = string

  validation {
    condition     = can(cidrnetmask(var.my_ip_cidr))
    error_message = "my_ip_cidr must be a valid IPv4 CIDR such as 203.0.113.10/32."
  }
}
