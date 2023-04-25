## Get Account ID
data "aws_caller_identity" "account_id" {}

locals {
  account_id = data.aws_caller_identity.account_id.account_id
}

# Create a Security Group For ALB
#tfsec:ignore:aws-ec2-no-public-egress-sgr
#tfsec:ignore:aws-ec2-no-public-ingress-sgr
resource "aws_security_group" "alb_sg" {
  name        = "ALB-SG"
  description = "Application Load Balancer - Security Group"
  vpc_id      = var.alb_vpc_id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "HTTP Traffic"
  }

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "HTTPS Traffic"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "Allow all Traffic"
  }
  tags = {
    Name = "ALB-SG"
  }
}

# Create Target Group
resource "aws_alb_target_group" "application_tg" {
  name                 = var.tg_name
  port                 = var.tg_port
  protocol             = var.tg_protocol
  vpc_id               = var.alb_vpc_id
  target_type          = var.tg_target_type
  deregistration_delay = "120"
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
    Name        = "${var.project_name}-TG"
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

## Get ALB Account ID
data "aws_elb_service_account" "main" {}

## Create Bucket for ALB logs store
#tfsec:ignore:aws-s3-encryption-customer-key tfsec:ignore:aws-s3-enable-bucket-logging
resource "aws_s3_bucket" "elb_logs" {
  bucket        = var.alb_logs_bucket_name
  force_destroy = true

  tags = {
    Name        = "${var.alb_logs_bucket_name}"
    Environment = "${var.env_suffix}"
  }
}

resource "aws_s3_bucket_public_access_block" "alb_access_block" {
  bucket                  = aws_s3_bucket.elb_logs.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

## Enable bucket versioning
resource "aws_s3_bucket_versioning" "alb_public_bucket_versioning" {
  bucket = aws_s3_bucket.elb_logs.id
  versioning_configuration {
    status = var.alb_bucket_versioning
  }
}

#tfsec:ignore:aws-s3-encryption-customer-key
resource "aws_s3_bucket_server_side_encryption_configuration" "alb_bucket_encryption" {
  bucket = aws_s3_bucket.elb_logs.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
resource "aws_s3_bucket_acl" "elb_logs_acl" {
  bucket = aws_s3_bucket.elb_logs.id
  acl    = "private"
}

data "aws_iam_policy_document" "allow_elb_logging" {
  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = [data.aws_elb_service_account.main.arn]
    }

    actions   = ["s3:PutObject"]
    resources = ["${aws_s3_bucket.elb_logs.arn}/${var.alb_log_prefix}/AWSLogs/${local.account_id}/*"]
  }
}

resource "aws_s3_bucket_policy" "allow_elb_logging" {
  bucket = aws_s3_bucket.elb_logs.id
  policy = data.aws_iam_policy_document.allow_elb_logging.json
}

# Create Application Load Balancer
#tfsec:ignore:aws-elb-alb-not-public
#tfsec:ignore:aws-elb-drop-invalid-headers
resource "aws_lb" "application_lb" {
  name                       = var.lb_name
  internal                   = var.lb_internal
  load_balancer_type         = var.lb_type
  security_groups            = ["${aws_security_group.alb_sg.id}"]
  subnets                    = var.lb_subnets
  enable_deletion_protection = var.lb_deletion_protection
  idle_timeout               = var.alb_idle_timeout

  access_logs {
    bucket  = aws_s3_bucket.elb_logs.id
    prefix  = var.alb_log_prefix
    enabled = var.alb_logs_enable
  }

  tags_all = {
    Name        = "${var.project_name}"
    Environment = "${var.env_suffix}"
  }
}

# Add ALB Listener
#tfsec:ignore:aws-elb-http-not-used
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
