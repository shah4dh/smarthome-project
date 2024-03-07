variable "vpc_name" {
  type = string
  default = "Terraform_VPC"
}

variable "igw_name" {
  type = string
  default = "Terraform_IGW"
}

variable "availability_zone" {
  type = list(string)
  default = [ "eu-west-2a", "eu-west-2b", "eu-west-2c" ]
}

variable "public_subnet_name" {
  type = string
  default = "Terraform_Public_Subnet"
}

variable "private_subnet_name" {
  type = string
  default = "Terraform_Private_Subnet"
}

variable "nat_name" {
  type = string
  default = "Terraform_NAT"
}

variable "public_rt_name" {
  type = string
  default = "Public_RT"
}

variable "private_rt_name" {
  type = string
  default = "Private_RT"
}



