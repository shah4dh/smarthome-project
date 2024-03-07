variable "dynamo_table_name" {
  type = string
  default = "Terraform Table"
}

variable "hash_key" {
  type = string
}

variable "hash_key_type" {
  type = string
  default = "N"
}

variable "billing_mode" {
  type = string
  default = "PAY_PER_REQUEST"
}