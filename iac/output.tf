output "vpc_id" {
  description = "ID da VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "Bloco CIDR da VPC"
  value       = module.vpc.vpc_cidr_block
}

output "db_endpoint" {
  description = "Endpoint banco de dados"    
  value = module.rds.db_endpoint
}

output "db_user" {
  description = "Usuário banco de dados"    
  value = module.rds.db_user
}

#output "db_pass" {
#  description = "Senha banco de dados"    
#  value = module.rds.db_pass
#}

output sg_database {
  description = "Grupos de segurança privado porta banco de dados"    
  value       = module.sg.sg_database
}

output sg_api {
  description = "Grupos de segurança privado porta da api"    
  value       = module.sg.sg_api
}

output sg_https_private {
  description = "Grupos de segurança privado porta https"  
  value       = module.sg.sg_https_private
}

output sg_ssh_private {
  description = "Grupos de segurança privado porta ssh"
  value       = module.sg.sg_ssh_private
}

output sg_k8s_workloads {
  description = "Grupos de segurança dos workloads kubernetes"
  value       = module.sg.sg_k8s_workloads
}

output "cluster_name" {
  description = "Nome do cluster"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "Endpoint para o servidor API server do Kubernetes"
  value       = module.eks.cluster_endpoint
}

output "cluster_id" {
  description = "ID do cluster"
  value       = module.eks.cluster_id
}

output "cluster_platform_version" {
  description = "Versão da plataforma para o cluster"
  value       = module.eks.cluster_platform_version
}

output "cluster_status" {
  description = "Status do cluster EKS `CREATING`, `ACTIVE`, `DELETING`, `FAILED`"
  value       = module.eks.cluster_status
}

output "cluster_addons" {
  description = "Complementos do cluster EKS ativados"
  value       = module.eks.cluster_addons
}


