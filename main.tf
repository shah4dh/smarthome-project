module "vpc" {
  source = "./modules/vpc"
}

module "security" {
  source = "./modules/security"

  vpc_id = module.vpc.vpc_id
}