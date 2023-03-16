resource "aws_security_group" "db_private" {
  name        = "database"
  description = "Traffic database"

  ingress {
    from_port   = var.ingress_db_port
    to_port     = var.ingress_db_port
    protocol    = "tcp"
    cidr_blocks = [var.ingress_db_cidr]
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

  ingress {
    from_port   = var.ingress_api_port
    to_port     = var.ingress_api_port
    protocol    = "tcp"
    cidr_blocks = [var.ingress_api_cidr]
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

  ingress {
    from_port   = var.ingress_https_port
    to_port     = var.ingress_https_port
    protocol    = "tcp"
    cidr_blocks = [var.ingress_https_cidr]
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
    cidr_blocks = [var.ingress_ssh_cidr]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}