# LAUNCH TEMPLATES

resource "aws_launch_template" "light_lt" {
  name = var.light_lt_name
  image_id = var.light_ami
  instance_type = var.instance_type
  key_name = var.key_name

  network_interfaces {
    associate_public_ip_address = true
    subnet_id = var.public_subnet_ids[0]
    security_groups = var.security_group_ids
  }
}

resource "aws_launch_template" "heat_lt" {
  name = var.heat_lt_name
  image_id = var.heat_ami
  instance_type = var.instance_type
  key_name = var.key_name

  network_interfaces {
    associate_public_ip_address = true
    subnet_id = var.public_subnet_ids[1]
    security_groups = var.security_group_ids
  }
}

resource "aws_launch_template" "status_lt" {
  name = var.status_lt_name
  image_id = var.status_ami
  instance_type = var.instance_type
  key_name = var.key_name

  network_interfaces {
    associate_public_ip_address = true
    subnet_id = var.public_subnet_ids[2]
    security_groups = var.security_group_ids
  }
}

resource "aws_launch_template" "auth_lt" {
  name = var.auth_lt_name
  image_id = var.auth_ami
  instance_type = var.instance_type
  key_name = var.key_name

  network_interfaces {
    associate_public_ip_address = true
    subnet_id = var.private_subnet_ids[0]
    security_groups = var.security_group_ids
  }
}

# AUTOSCALING GROUPS

resource "aws_autoscaling_group" "light_asg" {
  name               = var.light_asg_name
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size
  target_group_arns = [ var.lighting_tg_arn ]

  launch_template {
    id      = aws_launch_template.light_lt.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_group" "heat_asg" {
  name               = var.heat_asg_name
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size
  target_group_arns = [ var.heating_tg_arn ]

  launch_template {
    id      = aws_launch_template.heat_lt.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_group" "status_asg" {
  name               = var.status_asg_name
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size
  target_group_arns = [ var.status_tg_arn ]

  launch_template {
    id      = aws_launch_template.status_lt.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_group" "auth_asg" {
  name               = var.auth_asg_name
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size
  target_group_arns = [ var.auth_tg_arn ]

  launch_template {
    id      = aws_launch_template.auth_lt.id
    version = "$Latest"
  }
}

# ATTACHING LOAD BALANCERS

resource "aws_autoscaling_attachment" "lighting_lb_attachment" {
  autoscaling_group_name = aws_autoscaling_group.light_asg.name
  lb_target_group_arn   = var.lighting_tg_arn
}

resource "aws_autoscaling_attachment" "heating_lb_attachment" {
  autoscaling_group_name = aws_autoscaling_group.heat_asg.name
  lb_target_group_arn   = var.heating_tg_arn
}

resource "aws_autoscaling_attachment" "status_lb_attachment" {
  autoscaling_group_name = aws_autoscaling_group.status_asg.name
  lb_target_group_arn   = var.status_tg_arn
}

resource "aws_autoscaling_attachment" "auth_lb_attachment" {
  autoscaling_group_name = aws_autoscaling_group.auth_asg.name
  lb_target_group_arn   = var.auth_tg_arn
}