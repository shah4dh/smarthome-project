output "lighting_tg_arn" {
  value = aws_lb_target_group.lighting.arn
}

output "heating_tg_arn" {
  value = aws_lb_target_group.heating.arn
}

output "status_tg_arn" {
  value = aws_lb_target_group.status.arn
}

output "auth_tg_arn" {
  value = aws_lb_target_group.auth.arn
}