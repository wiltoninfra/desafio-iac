# Busca dados sobre zonas de disponibilidade
data "aws_availability_zones" "available" {}

# Concatena valores para gerar o nome do cluster utilizando caracteres de texto randomico
locals {
  cluster_name = "${var.project}-${random_string.suffix.result}"
}

# Gera caracteres de texto randomico
resource "random_string" "suffix" {
  length  = 8
  special = false
}

# Modulo remoto de Rede (VPC) Virtual private compute
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  name = var.project

  cidr = var.vpc_cidr
  azs  = slice(data.aws_availability_zones.available.names, 0, 3)

  private_subnets = var.subnet_private_cidr
  public_subnets  = var.subnet_public_cidr

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = 1
  }
}

# Módulo local de grupos de segurança
module "sg" {
  source           = "./modules/sg"
  ingress_db_port  = 3306
  ingress_api_port = 8080
  vpc_cidr         = module.vpc.vpc_cidr_block
  vpc_id           = module.vpc.vpc_id
}

# Modulo local para criação do banco de dados
module "rds" {
  source                      = "./modules/rds"
  project                     = var.project
  name                        = "db_letscode"
  allocated_storage           = 20
  max_allocated_storage       = 60
  storage_type                = "gp2"
  engine                      = "mysql"
  engine_version              = "8.0.27"
  db_instance_type            = "db.t2.micro"
  username                    = "letscode"
  allow_major_version_upgrade = false
  auto_minor_version_upgrade  = false
  backup_retention_period     = 15
  multi_az                    = false
  subnet_private_ids          = module.vpc.private_subnets
  security_group_ids          = [module.sg.sg_database]
}

# Módulo remoto Kubernetes EKS AWS
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.5.1"

  cluster_name    = local.cluster_name
  cluster_version = "1.25"

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  cluster_endpoint_public_access = true

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"

  }

  eks_managed_node_groups = {
    customers = {
      name = "workload-1"

      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 3
      desired_size = 2
    }

    services = {
      name = "workload-2"

      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }
}

data "aws_iam_policy" "ebs_csi_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}

#  IAM para contas de serviço
module "irsa-ebs-csi" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "4.7.0"

  create_role                   = true
  role_name                     = "AmazonEKSTFEBSCSIRole-${module.eks.cluster_name}"
  provider_url                  = module.eks.oidc_provider
  role_policy_arns              = [data.aws_iam_policy.ebs_csi_policy.arn]
  oidc_fully_qualified_subjects = ["system:serviceaccount:kube-system:ebs-csi-controller-sa"]
}

# Addons/Componentes do cluster kubernetes
resource "aws_eks_addon" "ebs-csi" {
  cluster_name = module.eks.cluster_name
  addon_name   = "aws-ebs-csi-driver"
  service_account_role_arn = module.irsa-ebs-csi.iam_role_arn
  tags = {
    "eks_addon" = "ebs-csi"
    "terraform" = "true"
  }
}

