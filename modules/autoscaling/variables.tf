variable "public_subnet_ids" {
  type = list(string)
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "lighting_tg_arn" {
  type = string
}

variable "heating_tg_arn" {
  type = string
}

variable "status_tg_arn" {
  type = string
}

variable "auth_tg_arn" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "light_ami" {
  type = string
  default = "ami-05d5f09c5fc650560"
}

variable "heat_ami" {
  type = string
  default = "ami-0f31c697e93e9d8c2"
}

variable "status_ami" {
  type = string
  default = "ami-0dfed0c424637b85e"
}

variable "auth_ami" {
  type = string
  default = "ami-09f57f5c23d9ec957"
}

variable "light_lt_name" {
  type = string
  default = "Light-LC"
}

variable "heat_lt_name" {
  type = string
  default = "Heat-LC"
}

variable "status_lt_name" {
  type = string
  default = "Status-LC"
}

variable "auth_lt_name" {
  type = string
  default = "Auth-LC"
}

variable "light_asg_name" {
  type = string
  default = "Lighting-ASG"
}

variable "heat_asg_name" {
  type = string
  default = "Heating-ASG"
}

variable "status_asg_name" {
  type = string
  default = "Status-ASG"
}

variable "auth_asg_name" {
  type = string
  default = "Auth-ASG"
}

variable "max_size" {
  type = number
  default = 1
}

variable "min_size" {
  type = number
  default = 1
}

variable "desired_capacity" {
  type = number
  default = 1
}