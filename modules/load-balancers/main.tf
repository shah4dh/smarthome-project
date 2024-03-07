# Load Balancers

resource "aws_lb" "public_alb" {
  name               = var.public_lb_name
  internal           = false
  load_balancer_type = var.lb_type
  subnets            = var.public_subnet_ids
}

resource "aws_lb" "private_alb" {
  name               = var.private_lb_name
  internal           = true
  load_balancer_type = var.lb_type
  subnets            = var.private_subnet_ids
}

# Target Groups

resource "aws_lb_target_group" "lighting" {
  name     = var.light_tb_name
  port     = 3000
  protocol = var.protocol
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group" "heating" {
  name     = var.heat_tb_name
  port     = 3000
  protocol = var.protocol
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group" "status" {
  name     = var.status_tb_name
  port     = 3000
  protocol = var.protocol
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group" "auth" {
  name     = var.auth_tb_name
  port     = 3000
  protocol = var.protocol
  vpc_id   = var.vpc_id
}

# LISTNERS

resource "aws_lb_listener" "light_listener" {
  load_balancer_arn = aws_lb.public_alb.arn
  port              = 3000
  protocol          = var.protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lighting.arn
  }
}

resource "aws_lb_listener_rule" "lighting_rule" {
  listener_arn = aws_lb_listener.light_listener.arn
  priority     = 100
  
  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.lighting.arn
  }

  condition {
    path_pattern {
      values = ["/api/lights/*"]
    }
  }
}

resource "aws_lb_listener" "heat_listener" {
  load_balancer_arn = aws_lb.public_alb.arn
  port              = 3001
  protocol          = var.protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.heating.arn
  }
}

resource "aws_lb_listener_rule" "heat_rule" {
  listener_arn = aws_lb_listener.heat_listener.arn
  priority     = 100
  
  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.heating.arn
  }

  condition {
    path_pattern {
      values = ["/api/heating/*"]
    }
  }
}

resource "aws_lb_listener" "status_listener" {
  load_balancer_arn = aws_lb.public_alb.arn
  port              = 3002
  protocol          = var.protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.status.arn
  }
}

resource "aws_lb_listener_rule" "status_rule" {
  listener_arn = aws_lb_listener.status_listener.arn
  priority     = 100
  
  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.status.arn
  }

  condition {
    path_pattern {
      values = ["/api/status/*"]
    }
  }
}

resource "aws_lb_listener" "auth_listener" {
  load_balancer_arn = aws_lb.private_alb.arn
  port              = 3000
  protocol          = var.protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.auth.arn
  }
}

resource "aws_lb_listener_rule" "auth_rule" {
  listener_arn = aws_lb_listener.auth_listener.arn
  priority     = 100
  
  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.auth.arn
  }

  condition {
    path_pattern {
      values = ["/api/*"]
    }
  }
}