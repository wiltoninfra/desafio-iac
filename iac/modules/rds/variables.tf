variable "name" {
  type        = string
  default     = "default-db"
  description = "Name resource RDS"
}

variable "project" {
  type        = string
  default     = "default"
  description = "Project name"
}

variable "db_instance_type" {
  type        = string
  default     = "default-db"
  description = "Capacity class of the DB instance"
}

variable "allocated_storage" {
  type        = number
  default     = 20
  description = "Disk DB Size"
}

variable "max_allocated_storage" {
  type        = number
  default     = 60
  description = "Disk Automatic Resize Limit"
}

variable "storage_type" {
  type        = string
  default     = "gp2"
  description = "Type of disk"
}

variable "engine" {
  type        = string
  default     = "mysql"
  description = "Type Engine DB"
}

variable "engine_version" {
  type        = string
  default     = "8.0"
  description = "Version Engine DB"
}

variable "username" {
  type        = string
  default     = "admin"
  description = "Username default DB"
}

variable "parameter_group_name" {
  type        = string
  default     = "default.mysql8.0"
  description = "DB parameter group resource"
}

variable "multi_az" {
  type        = bool
  default     = false
  description = "DB instance is a Multi-AZ"
}

variable "auto_minor_version_upgrade" {
  type        = bool
  default     = false
  description = "Upgrade version automatic"
}

variable "allow_major_version_upgrade" {
  type        = bool
  default     = false
  description = "Upgrade version automatic"
}

variable "backup_retention_period" {
  type        = number
  default     = 30
  description = "Days retention backup DB"
}

variable "security_group_ids" {
  type        = list
  default     = []
  description = "IDS Security groups VPC"
}

variable "subnet_private_ids" { }

