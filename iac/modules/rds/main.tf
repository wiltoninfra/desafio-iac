resource "random_password" "this" {
  length  = 24
  special = false
}

resource "aws_db_subnet_group" "private" {
  name       = "db-private-group"
  subnet_ids = var.subnet_private_ids

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "this" {
  #identifier                   = var.project
  identifier_prefix            = var.project
  db_name                      = var.name
  allocated_storage            = var.allocated_storage
  max_allocated_storage        = var.max_allocated_storage
  storage_type                 = var.storage_type
  engine                       = var.engine
  engine_version               = var.engine_version
  instance_class               = var.db_instance_type
  username                     = var.username
  password                     = random_password.this.result
  parameter_group_name         = var.parameter_group_name
  db_subnet_group_name         = aws_db_subnet_group.private.id
  vpc_security_group_ids       = var.security_group_ids
  allow_major_version_upgrade  = var.allow_major_version_upgrade
  auto_minor_version_upgrade   = var.auto_minor_version_upgrade
  backup_retention_period      = var.backup_retention_period
  backup_window                = "22:00-23:00"
  maintenance_window           = "Sat:00:00-Sat:03:00"
  multi_az                     = var.multi_az
  skip_final_snapshot          = true
  copy_tags_to_snapshot         = true
  #performance_insights_enabled = true
  tags = (
    {
      "Name" = format(
        "db-%s",
        var.project,
      )
    }
  )
}
