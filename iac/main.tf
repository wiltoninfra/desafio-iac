

module "vpc" {
  source         = "./modules/vpc"
  vpc_cidr       = ""
  subnet_public  = ""
  subnet_private = ""
}

module "sg" {
  source  = "./modules/sg"
    ingress_db_port = 3306
    ingress_db_cidr = module.vpc.vpc_cidr_block

    ingress_api_port = 8080
    ingress_api_cidr = module.vpc.vpc_cidr_block

    ingress_https_port = 443
    ingress_https_cidr = module.vpc.vpc_cidr_block

    ingress_ssh_port =  22
    ingress_ssh_cidr = module.vpc.vpc_cidr_block

}

module "rds" {
  source                      = "./modules/rds"
  name                        = "db-letscode"
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
  subnet_private_db           = [module.vpc.subnet_private_id]
  security_group_ids          = [module.sg.sg_database]
}
