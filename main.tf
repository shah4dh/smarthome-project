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
  vpc_id = module.vpc.vpc_id
}

module "load_balancers" {
  source = "./modules/load-balancers"

  public_subnet_ids = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
  vpc_id = module.vpc.vpc_id
}

module "autoscaling" {
  source = "./modules/autoscaling"

  public_subnet_ids = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
  lighting_tg_arn = module.load_balancers.lighting_tg_arn
  heating_tg_arn = module.load_balancers.heating_tg_arn
  status_tg_arn = module.load_balancers.status_tg_arn
  auth_tg_arn = module.load_balancers.auth_tg_arn
  instance_type = module.servers.instance_type
  key_name = module.servers.key_name 
  security_group_ids = module.security.security_group_ids 
}