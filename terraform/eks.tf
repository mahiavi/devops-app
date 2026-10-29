module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = var.cluster_name
  kubernetes_version = var.kubernetes_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # Restrict public Kubernetes API access to the caller's IP.
  endpoint_public_access       = true
  endpoint_private_access      = true
  endpoint_public_access_cidrs = [var.my_ip_cidr]

  enable_cluster_creator_admin_permissions = true

  # EKS Auto Mode owns node provisioning/scaling; do not add a managed node group here.
  compute_config = {
    enabled    = true
    node_pools = ["general-purpose"]
  }

  # Core cluster add-ons. Auto Mode also manages several infrastructure capabilities.
  addons = {
    coredns = {}

    eks-pod-identity-agent = {
      before_compute = true
    }

    kube-proxy = {}

    vpc-cni = {
      before_compute = true
    }
  }
  tags = {
    Project     = var.project_name
    Environment = "dev"
    Terraform   = "true"
  }
}
