output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "subnet_private_id" {
  value       = module.vpc.subnet_private_id
  description = "IDs Subnets private"
}

output "subnet_public_id" {
  value       = module.vpc.subnet_public_id
  description = "IDs Subnets public"
}

output sg_database {
  value       = module.sg.sg_database
  description = "description"
}



