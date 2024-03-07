# DYNAMODB TABLE

resource "aws_dynamodb_table" "dynamo" {
  name             = var.dynamo_table_name
  hash_key         = var.hash_key
  billing_mode     = var.billing_mode

  attribute {
    name = var.hash_key
    type = var.hash_key_type
  }
}