module "eks" {

  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.1"

  cluster_name    = local.project_name
  cluster_version = "1.31"

  cluster_endpoint_public_access = true

  vpc_id = module.vpc.vpc_id

  subnet_ids               = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.intra_subnets

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

  eks_managed_node_group_defaults = {

    instance_types = ["m7i-flex.large"]

    attach_cluster_primary_security_group = true
  }

  eks_managed_node_groups = {

    ecommerce_nodes = {

      min_size     = 1
      max_size     = 2
      desired_size = 1

      instance_types = ["m7i-flex.large"]

      capacity_type = "ON_DEMAND"

      ami_type = "AL2023_x86_64_STANDARD"

      disk_size = 35

      use_custom_launch_template = false

      tags = {
        Name        = "ecommerce-worker-node"
        Environment = "dev"
        Project     = local.project_name
      }
    }
  }

  tags = local.common_tags
}

data "aws_instances" "eks_nodes" {

  instance_tags = {
    "eks:cluster-name" = module.eks.cluster_name
  }

  filter {
    name   = "instance-state-name"
    values = ["running"]
  }

  depends_on = [module.eks]
}