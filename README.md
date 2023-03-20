# Desafio DevOps - Letscodebyada
 

## Estrutura de pastas

|     Caminho    |Descrição              
|----------------|-------------------------------|
|backend|Pasta que contem a API para aplicação letscodebyada-app
|frontend|Contem arquivos referentes ao frontend letscodebyada-app
|iac|Infraestrutura como código principais componentes AWS
|k8s|Terraform com manifestos do kubernetes helm

  
## Desenvolvimento Local

Para realizar o desenvolvimento local do frontend e backend você pode utilizar o docker compose para subir uma stack com banco de dados incluso para isso execute o comando abaixo:

```ssh
make dev-start
```

**Acesse o frontend com o usuário e senha**
Frontend:  http://localhost:4200
Backend: http://localhost:8087
  
```
User: Admin
Pass: password
```
  
## Executando o terraform

 Para saber mais sobre as configurações aplicadas utilizando terraform acesse a documentação [Terraform README](./iac/README.md) para executar o terraform acesse a pasta `iac` e execute os comandos abaixo:

### Iniciando módulos
**Usando backend remoto**

Para isso você precisa informar o nome do bucket S3 onde os arquivos do state devem ficar salvos, bem como o nome da tabela no dynamodb para realizar o lock o apply.

```ssh
terraform init -backend-config=environments/backend.dev.hcl -var-file=environments/dev.tfvars
```

**Usando backend local**

```ssh
terraform init -var-file=environments/dev.tfvars
```

**Verificando plano de execução** 

```ssh
terraform plan -var-file=environments/dev.tfvars
```

**Aplicando as configurações** 

```ssh
terraform apply -var-file=environments/dev.tfvars
```