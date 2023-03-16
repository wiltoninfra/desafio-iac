variable ingress_db_port {
  type        = number
  default     = 3306
  description = "description"
}

variable ingress_api_port {
  type        = number
  default     = 8080
  description = "description"
}

variable ingress_https_port {
  type        = number
  default     = 443
  description = "description"
}

variable ingress_ssh_port {
  type        = number
  default     = 22
  description = "description"
}

variable ingress_db_cidr {
  type        = string
  default     = ""
  description = "description"
}

variable ingress_api_cidr {
  type        = string
  default     = ""
  description = "description"
}

variable ingress_https_cidr {
  type        = string
  default     = ""
  description = "description"
}

variable ingress_ssh_cidr {
  type        = string
  default     = ""
  description = "description"
}