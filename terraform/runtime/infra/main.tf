terraform {
  required_version = ">= 1.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

####################
# VPC (runtime)
####################
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "eks-vpc-runtime"
  cidr = "10.20.0.0/16"

  azs             = ["${var.region}a", "${var.region}b"]
  private_subnets  = ["10.20.1.0/24", "10.20.2.0/24"]
  public_subnets   = ["10.20.101.0/24", "10.20.102.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  # Recomendado para EKS + Load Balancers
  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }

}

####################
# EKS (runtime)
####################
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_irsa = true

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {

    # === Runtime (routers / message processors) ===
    apigee-runtime = {
      desired_size = 3
      min_size     = 3
      max_size     = 5

      instance_types = ["m5.large"]
      capacity_type  = "ON_DEMAND"

      labels = {
        apigee-role = "runtime"
      }
    }

    # === Data / analytics / cassandra ===
    apigee-data = {
      desired_size = 3
      min_size     = 3
      max_size     = 3

      instance_types = ["m5.xlarge"]
      capacity_type  = "ON_DEMAND"

      labels = {
        apigee-role = "data"
      }

      # normalmente no quieres que se muevan
      taints = [{
        key    = "apigee-data"
        value  = "true"
        effect = "NO_SCHEDULE"
      }]
    }
  }
}
