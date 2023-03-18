variable vpc_id {
  type        = string
  default     = ""
  description = "VPC ID"
}

variable vpc_cidr {
  type        = string
  default     = ""
  description = "CIDR VPC"
}

variable ingress_db_port {
  type        = number
  default     = 3306
  description = "Port access mysql server port default"
}

variable ingress_api_port {
  type        = number
  default     = 8080
  description = "Port API"
}

variable ingress_https_port {
  type        = number
  default     = 443
  description = "HTTPS port default"
}

variable ingress_ssh_port {
  type        = number
  default     = 22
  description = "SSH Port default"
}