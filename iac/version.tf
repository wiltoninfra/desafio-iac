terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.47.0"
    }
    random = {
      source  = "hashicorp/random"        
      version = ">= 3.4.3"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.10"
    }    
  }
  required_version = ">= 1.3.1"
}
