output sg_database {
  value       = aws_security_group.db_private.id
  description = "description"
}

output sg_api {
  value       = aws_security_group.api_private.id
}

output sg_https_private {
  value       = aws_security_group.https_private.id
}

output sg_ssh_private {
  value       = aws_security_group.ssh_private.id
}

output sg_k8s_workloads {
  value       = aws_security_group.k8s-workloads.id
}