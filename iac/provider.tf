provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.aws_region
}

locals {
  tags = {
    project     = var.project
    environment = var.environment
    region      = var.aws_region
  }
}