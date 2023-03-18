## Tags obrigatórias
project     = "letscode"
environment = "production"

# Autenticação para uso local
aws_region = "us-east-1"
access_key = ""
secret_key = ""

# Configurações de Rede (VPC)
vpc_cidr            = "10.0.0.0/16"
subnet_public_cidr  = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
subnet_private_cidr = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]

# Informações dos dominios
observability_domain = "metrics.meudominio.com.br"
backend_domain       = "api.meudominio.com.br"
frontend_domain      = "app.meudominio.com.br"
