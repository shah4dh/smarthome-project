# VPC

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.vpc_name
  }
}

# INTERNET GATEWAY

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.igw_name
  }
}

# PUBLIC SUBNETS

resource "aws_subnet" "public" {
  count = length(var.availability_zone)
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.${count.index + 1}.0/24"
  map_public_ip_on_launch = true 
  availability_zone = "${var.availability_zone[count.index]}"
  
  tags = {
    Name = "${var.public_subnet_name}${count.index + 1}"
  }
}

# PRIVATE SUBNETS

resource "aws_subnet" "private" {
  count = length(var.availability_zone)
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.${count.index + 10}.0/24"
  availability_zone = "${var.availability_zone[count.index]}"
  
  tags = {
    Name = "${var.private_subnet_name}${count.index + 1}"
  }
}

# NAT GATEWAY

resource "aws_nat_gateway" "nat" {
  subnet_id     = aws_subnet.public[0].id
  allocation_id = aws_eip.nat.id

  tags = {
    Name = "${var.nat_name}_1"
  }
}

resource "aws_eip" "nat" {
  domain   = "vpc"
}

# PUBLIC TABLE

resource "aws_route_table" "public_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.public_rt_name
  }
}

resource "aws_route_table_association" "public" {
  count = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_table.id
}

# PRIVATE TABLES

resource "aws_route_table" "private_table" {
  count = length(aws_subnet.private)
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.private_rt_name}-${var.availability_zone[count.index]}"
  }
}

resource "aws_route_table_association" "private" {
  count = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_table[count.index].id
}

resource "aws_route" "private" {
  route_table_id = aws_route_table.private_table[0].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat.id
}
