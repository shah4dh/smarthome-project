variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "light_name" {
  type = string
  default = "Lighting"
}

variable "heat_name" {
  type = string
  default = "Heating"
}

variable "status_name" {
  type = string
  default = "Status"
}

variable "auth_name" {
  type = string
  default = "Auth"
}

variable "region" {
  type = string
  default = "eu-west-2"
}

variable "key_name" {
  type = string
  default = "firstkey"
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}
