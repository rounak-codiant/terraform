output "target_group_arn" {
  value = aws_alb_target_group.application_tg.arn
}

output "alb_id" {
  value = aws_lb.application_lb.id
}
