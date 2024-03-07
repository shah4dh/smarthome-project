output "public_lb_arn" {
  value = aws_lb.public_alb.arn
}

output "private_lb_arn" {
  value = aws_lb.private_alb.arn
}