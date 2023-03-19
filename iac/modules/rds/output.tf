output "db_pass" {
  value = aws_db_instance.this.password
}

output "db_user" {
  value = aws_db_instance.this.username
}

output "db_endpoint" {
  value = aws_db_instance.this.endpoint
}