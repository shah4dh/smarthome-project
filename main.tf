module "vpc" {
  source = "./modules/vpc"
}

module "security" {
  source = "./modules/security"

  vpc_id = module.vpc.vpc_id
}

module "lighting" {
  source = "./modules/dynamo"

  dynamo_table_name = var.light_name
  hash_key = var.light_hash_key
  hash_key_type = var.hash_key_type
}

module "heating" {
  source = "./modules/dynamo"

  dynamo_table_name = var.heat_name
  hash_key = var.heat_hash_key
  hash_key_type = var.hash_key_type
}

module "servers" {
  source = "./modules/servers"

  public_subnet_ids = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
  security_group_ids = module.security.security_group_ids
}