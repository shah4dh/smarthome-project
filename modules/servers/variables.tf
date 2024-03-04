variable "instance_type" {
  type = string
  default = "t3.micro"
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

variable "public_subnet_ids" {
  type = list(string)
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}