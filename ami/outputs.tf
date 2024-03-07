output "light_ami_id" {
  value = aws_ami_from_instance.light_ami.id
}

output "heat_ami_id" {
  value = aws_ami_from_instance.heat_ami.id
}

output "status_ami_id" {
  value = aws_ami_from_instance.status_ami.id
}

output "auth_ami_id" {
  value = aws_ami_from_instance.auth_ami.id
}