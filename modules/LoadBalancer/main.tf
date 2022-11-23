
# Create a Security Group For ALB
resource "aws_security_group" "alb_sg" {
  name        = "ALB-SG"
  description = "Application Load Balancer - Security Group"
  vpc_id      = var.alb_vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP Traffic"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTPS Traffic"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "ALB-SG"
  }
}

# Create Target Group
resource "aws_alb_target_group" "application_tg" {
  name        = var.tg_name
  port        = var.tg_port
  protocol    = var.tg_protocol
  vpc_id      = var.alb_vpc_id
  target_type = var.tg_target_type
  # deregistration_delay = "120"
  health_check {
    path                = var.lb_tg_health_check_path
    interval            = 60
    port                = var.lb_tg_health_check_port
    protocol            = var.lb_tg_health_check_protocol
    timeout             = 3
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = var.lb_tg_health_check_matcher
  }
  tags_all = {
    Name        = "${var.project_name}"
    Environment = "${var.env_suffix}"
  }
}

# Attach EC2 instance to Target Group
resource "aws_lb_target_group_attachment" "register_instance_tg" {
  target_group_arn = aws_alb_target_group.application_tg.arn
  target_id        = var.lb_target_id
  port             = 80

  depends_on = [
    aws_alb_target_group.application_tg
  ]
}

# Create Application Load Balancer
resource "aws_lb" "application_lb" {
  name                       = var.lb_name
  internal                   = var.lb_internal
  load_balancer_type         = var.lb_type
  security_groups            = ["${aws_security_group.alb_sg.id}"]
  subnets                    = var.lb_subnets
  enable_deletion_protection = var.lb_deletion_protection

  access_logs {
    enabled = var.lb_access_logs
    bucket  = var.lb_access_logs_bucket
    prefix  = var.lb_access_logs_prefix
  }

  tags_all = {
    Name        = "${var.project_name}"
    Environment = "${var.env_suffix}"
  }
}

# Add ALB Listener
resource "aws_alb_listener" "application_lb_listener" {
  load_balancer_arn = aws_lb.application_lb.arn
  protocol          = var.lb_listener_protocol
  port              = var.lb_listener_port
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.application_tg.arn
  }

  depends_on = [
    aws_alb_target_group.application_tg,
    aws_lb.application_lb
  ]
}
