variable "vpc_cidr" {
  type        = string
  default     = ""
  description = "CIDR Block VPC"
}

variable "subnet_public" {
  type        = string
  default     = ""
  description = "Subnet Public"
}

variable "subnet_private" {
  type        = string
  default     = ""
  description = "Subnet Private"
}

variable "availability_zone" {
  type        = list(any)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  description = "Map AZS"
}

variable "private_cidr" {
  type        = list(string)
  default     = ["10.0.50.0/24", "10.0.51.0/24", "10.0.52.0/24"]
  description = "description"
}

variable "public_cidr" {
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
  description = "description"
}
