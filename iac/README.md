# Infraestrutura como código

Este diretório possui os arquivos necessários para provisionar infraestrutura base utilizando a AWS como provedor de nuvem.

- VPC
- Security Groups
- EKS
- RDS

## VPC 

A VPC foi configurada pensando em um ambiente pequeno mas com espaço suficiente para criar ambientes de testes e realizar testes de carga.

```yaml
vpc_cidr            = "10.0.0.0/16"
subnet_public_cidr  = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
subnet_private_cidr = ["10.0.50.0/24", "10.0.51.0/24", "10.0.52.0/24"]
```

CIDR (Classless Inter-Domain Routing Total de 65.536 endereços IPv4)
SUBNET_PUBLIC (Sub rede pública) acesso publico e cada sub rede pode ter até 256 IPv4
SUBNET_PRIVATE (Sub rede privado) acesso privado apenas na VPC e cada sub rede pode ter até 256 IPv4

# Cluster Kubernetes AWS - EKS

O cluster de kubernetes utilizando o serviço da AWS EKS.


## Congiguração kubeconfig local

Configure as suas credenciais da AWS e execute o comando abaixo, após criar a infraestrutura.

```ssh
aws eks --region us-east-1 update-kubeconfig --name cluster_name
```

## Github Actions variaveis de ambiente

```
INFRACOST_API_KEY
AWS_ACCESS_KEY
AWS_SECRET_KEY
AWS_REGION
```