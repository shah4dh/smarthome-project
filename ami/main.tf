# AMI's

resource "aws_ami_from_instance" "light_ami" {
  name               = var.light_ami_name
  source_instance_id = var.light_id
}

resource "aws_ami_from_instance" "heat_ami" {
  name               = var.heat_ami_name
  source_instance_id = var.heat_id
}

resource "aws_ami_from_instance" "status_ami" {
  name               = var.status_ami_name
  source_instance_id = var.status_id
}

resource "aws_ami_from_instance" "auth_ami" {
  name               = var.auth_ami_name
  source_instance_id = var.auth_id
}