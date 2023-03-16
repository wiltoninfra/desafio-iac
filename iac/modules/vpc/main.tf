## VPC Main create
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames           = true
  enable_dns_support             = true
  tags = {
    Name = "vpc-main"
  }
  lifecycle {
    ignore_changes = [tags.Name]
  }  
}

## Subnet Private
resource "aws_subnet" "private" {
  count = "${length(var.availability_zone)}"
  vpc_id     = aws_vpc.main.id
  cidr_block =  "${var.private_cidr[count.index]}"
  availability_zone = "${var.availability_zone[count.index]}"
  tags = merge(
    {
      "Name" = format(
        "subnet-private-%s",        
        element(var.availability_zone, count.index),
      )
    }
  )
}

resource "aws_route_table" "private" {
  count = length(aws_subnet.private) > 0 ? 1 : 0
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "rt-private-main"
  }
}

## Subnet Public
resource "aws_subnet" "public" {
  count = "${length(var.availability_zone)}"
  vpc_id     = aws_vpc.main.id
  cidr_block = "${var.public_cidr[count.index]}"
  availability_zone = "${var.availability_zone[count.index]}"
  tags = merge(
    {
      "Name" = format(
        "subnet-public-%s",        
        element(var.availability_zone, count.index),
      )
    }
  )

}

resource "aws_internet_gateway" "this" {
  count = length(aws_subnet.public) > 0 ? 1 : 0
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "ig-public-main"
  }
}

resource "aws_route_table" "public" {
  count = length(aws_subnet.public) > 0 ? 1 : 0
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "rt-public-main"
  }
}

resource "aws_route" "public_internet_gateway" {
  count = length(aws_subnet.public) > 0 ? 1 : 0
  route_table_id         = aws_route_table.public[0].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this[0].id
  timeouts {
    create = "5m"
  }
}

resource "aws_route" "public_internet_gateway_ipv6" {
  count = length(aws_subnet.public) > 0 ? 1 : 0
  route_table_id              = aws_route_table.public[0].id
  destination_ipv6_cidr_block = "::/0"
  gateway_id                  = aws_internet_gateway.this[0].id
}





