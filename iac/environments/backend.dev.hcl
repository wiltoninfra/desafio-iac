bucket         = "cw-infra-config" 
key            = "letscode/dev/terraform.tfstate"
region         = "us-east-1"
dynamodb_table = "terraform-states-backend"
encrypt        = true