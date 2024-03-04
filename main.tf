module "vpc" {
  source = "./modules/vpc"
}

module "security" {
  source = "./modules/security"

  vpc_id = module.vpc.vpc_id
}

module "lighting" {
  source = "./modules/dynamo"

  dynamo_table_name = "Lighting"
  hash_key = 1
  hash_key_type = "N"
}

module "heating" {
  source = "./modules/dynamo"

  dynamo_table_name = "Heating"
  hash_key = 2
  hash_key_type = "N"
}