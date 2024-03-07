variable "vpc_id" {
    type = string
}

variable "public_subnet_ids" {
    type = list(string)
}

variable "private_subnet_ids" {
    type = list(string)
}

variable "public_lb_name" {
  type = string
  default = "public-lb"
}

variable "private_lb_name" {
  type = string
  default = "private-lb"
}

variable "lb_type" {
  type = string
  default = "application"
}

variable "light_tb_name" {
  type = string
  default = "lighting-target-group"
}

variable "heat_tb_name" {
  type = string
  default = "heating-target-group"
}

variable "status_tb_name" {
  type = string
  default = "status-target-group"
}

variable "auth_tb_name" {
  type = string
  default = "auth-target-group"
}

variable "protocol" {
  type = string
  default = "HTTP"
}