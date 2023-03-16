## Desafio DevOps 



### Executando o terraform

Iniciando módulos

Usando backend remoto
```ssh
terraform init -backend-config=environments/backend.dev.hcl -var-file=environments/dev.tfvars
```

Usando backend local
```ssh
terraform init -backend-config=environments/backend.dev.hcl -var-file=environments/dev.tfvars
```

Verificando plano de execução

```ssh
terraform plan -var-file=environments/dev.tfvars 
```

