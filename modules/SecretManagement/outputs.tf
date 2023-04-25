output "secret_manager_arn" {
  value       = aws_secretsmanager_secret.secretmanager.arn
  description = "Get the ARN of the secret manager"
}
