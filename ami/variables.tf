variable "light_id" {
  type = string
  default = "i-099dab7b04ab7b2c7"
}

variable "heat_id" {
  type = string
  default = "i-0c49e8ae243843691"
}

variable "status_id" {
  type = string
  default = "i-01457fb87920536b2"
}

variable "auth_id" {
  type = string
  default = "i-0718aa06649a54145"
}

variable "light_ami_name" {
  type = string
  default = "Lights-AMI"
}

variable "heat_ami_name" {
  type = string
  default = "Heats-AMI"
}

variable "status_ami_name" {
  type = string
  default = "Status-AMI"
}

variable "auth_ami_name" {
  type = string
  default = "Auth-AMI"
}