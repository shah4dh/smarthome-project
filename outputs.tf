output "vpc_id" {
  value = module.vpc.vpc_id
}

output "security_group_ids" {
  value = module.security.security_group_ids
}