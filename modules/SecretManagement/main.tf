resource "aws_secretsmanager_secret" "secretmanager" {
  name                    = var.secretmanager_name
  recovery_window_in_days = "7"
  tags = {
    Name        = "${var.project_name}-SecretManager"
    Environment = "${var.env_suffix}"
  }
}

resource "aws_secretsmanager_secret_version" "secret_value" {
  secret_id = aws_secretsmanager_secret.secretmanager.id
  secret_string = jsonencode(
    {
      # "AWS_KEY" : "${var.sm_iam_key}",
      # "AWS_SECRET" : "${var.sm_iam_secret}",
      "AWS_PUBLIC_BUCKET" : "${var.sm_public_bucket}",
      "AWS_PRIVATE_BUCKET" : "${var.sm_private_bucket}",
      "DB_CONNECTION" : "${var.sm_db_connection}",
      "DB_HOST" : "${var.sm_db_host}",
      "DB_PORT" : "${var.sm_db_port}",
      "DB_DATABASE" : "${var.sm_db_name}",
      "DB_USERNAME" : "${var.sm_db_user}",
      "DB_PASSWORD" : "${var.sm_db_password}",
      "REDIS_HOST" : "${var.sm_redis_host}",
      "REDIS_PORT" : "${var.sm_redis_port}"
    }
  )
}