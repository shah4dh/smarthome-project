output "light_asg_id" {
  value = aws_autoscaling_group.light_asg.id
}

output "heat_asg_id" {
  value = aws_autoscaling_group.heat_asg.id
}

output "status_asg_id" {
  value = aws_autoscaling_group.status_asg.id
}

output "auth_asg_id" {
  value = aws_autoscaling_group.auth_asg.id
}