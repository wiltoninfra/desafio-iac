output "vpc_id" {
  value       = aws_vpc.main.id
}

output "vpc_cidr_block" {
  value       = aws_vpc.main.cidr_block
}

output "subnet_private_id" {
  value = aws_subnet.private[*].id
}

output "subnet_public_id" {
  value = aws_subnet.public[*].id
}