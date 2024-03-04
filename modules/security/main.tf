# HTTP SECURITY

resource "aws_security_group" "allow_http" {
  name        = var.http_security_name
  description = var.http_description
  vpc_id      = var.vpc_id

  tags = {
    Name = var.http_security_name
  }
}

resource "aws_security_group_rule" "allow_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.allow_http.id
}

resource "aws_vpc_security_group_ingress_rule" "ssh_http" {
  security_group_id = aws_security_group.allow_http.id

  cidr_ipv4   = var.my_ip
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"
}

# HTTPS SECURITY

resource "aws_security_group" "allow_https" {
  name        = var.https_security_name
  description = var.https_description
  vpc_id      = var.vpc_id

  tags = {
    Name = var.https_security_name
  }
}

resource "aws_security_group_rule" "allow_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"] 
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.allow_https.id
}

resource "aws_vpc_security_group_ingress_rule" "ssh_https" {
  security_group_id = aws_security_group.allow_https.id

  cidr_ipv4   = var.my_ip
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"
}

# EGRESS RULES

resource "aws_security_group" "allow_egress" {
  name        = var.egress_security_name
  description = var.egress_description
  vpc_id      = var.vpc_id

  tags = {
    Name = var.egress_security_name
  }
}

resource "aws_security_group_rule" "allow_http_egress" {
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.allow_egress.id
}

resource "aws_security_group_rule" "allow_https_egress" {
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.allow_egress.id
}
