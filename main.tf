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

module "servers" {
  source = "./modules/servers"

  public_subnet_ids = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
  security_group_ids = module.security.security_group_ids
}