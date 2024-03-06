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
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.allow_http.id
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

# SSH SECURITY

resource "aws_security_group" "allow_ssh" {
  name        = var.ssh_security_name
  description = var.ssh_description
  vpc_id      = var.vpc_id

  tags = {
    Name = var.ssh_security_name
  }
}

resource "aws_security_group_rule" "allow_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.my_ip]
  security_group_id = aws_security_group.allow_ssh.id
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
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.allow_egress.id
}
