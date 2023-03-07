module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = "team1project3"
  cluster_version = "1.24"

  cluster_endpoint_public_access = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }
  vpc_id     = "vpc-08685aef758de67b8"
  subnet_ids = [var.t1-proj3prisubs1, var.t1-proj3prisubs2]
  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = ["t3.medium"]
  }
  eks_managed_node_groups = {
    blue = {}
    green = {
      min_size     = 2
      max_size     = 2
      desired_size = 2

      instance_types = ["t3.medium"]
      capacity_type  = "SPOT"
    }
  }
  # aws-auth configmap
  manage_aws_auth_configmap = false
  tags = {
    Owner = "t1-proj3"
  }
}