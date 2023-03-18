resource "aws_security_group" "db_private" {
  name        = "database"
  description = "Traffic database"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.ingress_db_port
    to_port     = var.ingress_db_port
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "api_private" {
  name        = "api"
  description = "Traffic api"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.ingress_api_port
    to_port     = var.ingress_api_port
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "https_private" {
  name        = "https"
  description = "Traffic https"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.ingress_https_port
    to_port     = var.ingress_https_port
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "ssh_private" {
  name        = "ssh"
  description = "Traffic ssh"

  ingress {
    from_port   = var.ingress_ssh_port
    to_port     = var.ingress_ssh_port
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "k8s-workloads" {
  name_prefix = "k8s_workload_default"
  vpc_id      = var.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }
}
