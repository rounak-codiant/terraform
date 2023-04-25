output "target_group_arn" {
  description = "Load balancer ARN"
  value       = aws_alb_target_group.application_tg.arn
}

output "alb_id" {
  description = "Load balancer ID"
  value       = aws_lb.application_lb.id
}
