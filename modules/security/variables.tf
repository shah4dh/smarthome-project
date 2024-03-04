variable "vpc_id" {
  type = string
}

variable "my_ip" {
  type = string
  default = "154.56.242.95/32"
}

variable "http_security_name" {
  type = string
  default = "Allow_HTTP"
}

variable "http_description" {
  type = string
  default = "Allow HTTP inbound traffic through"
}

variable "https_security_name" {
  type = string
  default = "Allow_HTTPS"
}

variable "https_description" {
  type = string
  default = "Allow HTTPS inbound traffic through"
}

variable "egress_security_name" {
  type = string
  default = "Allow_Egress"
}

variable "egress_description" {
  type = string
  default = "Allow Egress inbound traffic through"
}