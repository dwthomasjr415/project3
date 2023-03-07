module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"
#Cluster Defaults
  cluster_name    = "team1project3"
  cluster_version = "1.24"
  cluster_endpoint_public_access = true
  cluster_endpoint_private_access = true
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
    t1-project3 = {
      min_size     = 2
      max_size     = 2
      desired_size = 2
      instance_types = ["t3.medium"]
      capacity_type  = "SPOT"
    }
  }
  # aws-auth configmap
  manage_aws_auth_configmap = false

  # aws_auth_roles = [
  #   {
  #     rolearn  = "arn:aws:iam::257248662189:role/team1project3-cluster-20230307003005940400000002"
  #     username = "Student"
  #     groups   = ["system:masters"]
  #   }
  # ]
  # aws_auth_accounts = [
  #   "257248662189"
  # ]
  # aws_auth_users = [
  #   {
  #     userarn  = "arn:aws:sts::257248662189:assumed-role/AWSReservedSSO_Student_7a53284de0a60a54/cmason4109@gmail.com"
  #     username = "admin"
  #     groups   = ["system:masters"]
  #   }
  ]
  tags = {
    Owner = "t1-proj3"
  }
}