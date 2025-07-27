provider "aws" {
  region = var.region
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.5"

  cluster_name    = var.cluster_name
  cluster_version = "1.29"
  subnet_ids      = var.subnet_ids
  vpc_id          = var.vpc_id

  eks_managed_node_groups = {
    node_group = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_types = ["t2.micro"]
    }
  }

  enable_irsa = true
}
