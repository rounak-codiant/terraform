resource "aws_alb_target_group" "application_tg" {
  name = var.tg_name
  port = var.tg_port
  protocol = var.tg_protocol
  vpc_id = var.lb_vpc_id
  target_type = var.tg_target_type
  health_check {
    path = var.lb_tg_health_check_path
    interval = 60
    port = var.lb_tg_health_check_port
    protocol = var.lb_tg_health_check_protocol
    timeout = 3
    healthy_threshold = 3
    unhealthy_threshold = 3
    matcher = var.lb_tg_health_check_matcher
  }
  tags = {
    Name        = "${var.project_name}"
    Environment = "${var.env_suffix}"
  }
}
  
resource "aws_lb" "application_lb" {
  name               = var.lb_name
  internal           = var.lb_internal
  load_balancer_type = var.lb_type
  security_groups    = [var.lb_security_groups]
  subnets            = [var.lb_subnets]  # [for subnet in aws_subnet.public : subnet.id]

  enable_deletion_protection = var.lb_deletion_protection

  access_logs {
    enabled = var.lb_access_logs
    bucket  = var.lb_access_logs_bucket
    prefix  = var.lb_access_logs_prefix
  }

  tags = {
    Name        = "${var.project_name}"
    Environment = "${var.env_suffix}"
  }
}

resource "aws_alb_listener" "application_lb_listener" {
  load_balancer_arn = aws_lb.application_lb.arn
  protocol          = var.lb_listener_protocol
  port              = var.lb_listener_port
  default_action {
    type = "forward"
    target_group_arn = aws_alb_target_group.application_tg.arn
  }
}