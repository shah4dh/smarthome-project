# EC2 INSTANCES

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "light" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_ids[0]
  associate_public_ip_address = true
  key_name = var.key_name
  vpc_security_group_ids = var.security_group_ids 

  tags = {
    Name = var.light_name
  }
}

resource "aws_instance" "heat" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_ids[1]
  associate_public_ip_address = true
  key_name = var.key_name
  vpc_security_group_ids = var.security_group_ids 

  tags = {
    Name = var.heat_name
  }
}

resource "aws_instance" "status" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_ids[2]
  associate_public_ip_address = true
  key_name = var.key_name
  vpc_security_group_ids = var.security_group_ids 

  tags = {
    Name = var.status_name
  }
}

resource "aws_instance" "auth" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_ids[0]
  associate_public_ip_address = false
  key_name = var.key_name
  vpc_security_group_ids = [var.security_group_ids[1] , var.security_group_ids[3]] // http + ssh

  tags = {
    Name = var.auth_name
  }
}
