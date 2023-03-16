bucket         = "tf-state" 
key            = "letscode/prod/terraform.tfstate"
region         = "us-east-1"
dynamodb_table = "terraform-states-backend"
encrypt        = true