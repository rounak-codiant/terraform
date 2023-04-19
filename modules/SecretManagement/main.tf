# Get the random string
resource "random_id" "id" {
  byte_length = 4
}

# Create Secret Manager
resource "aws_secretsmanager_secret" "secretmanager" {
  name                    = "${var.secretmanager_name}-${random_id.id.hex}"
  description             = "To store secret keys"
  recovery_window_in_days = "7"
  tags = {
    Name        = "${var.project_name}-Secret-Manager"
    Environment = "${var.env_suffix}"
  }
}

# Store keys in Secret Manger
resource "aws_secretsmanager_secret_version" "secret_value" {
  secret_id = aws_secretsmanager_secret.secretmanager.id
  secret_string = jsonencode(
    {
      #  Database Keys
      "DB_CONNECTION" : "${var.sm_db_connection}",
      "DB_HOST" : "${var.sm_db_host}",
      "DB_READ_HOST" : "${var.sm_db_read_host}",
      "DB_PORT" : "${var.sm_db_port}",
      "DB_DATABASE" : "${var.sm_db_name}",
      "DB_USERNAME" : "${var.sm_db_user}",
      "DB_PASSWORD" : "${var.sm_db_password}",
      #  SMTP Keys
      "MAIL_DRIVER" : "${var.sm_mail_driver}",
      "MAIL_HOST" : "${var.sm_mail_host}",
      "MAIL_PORT" : "${var.sm_mail_port}",
      "MAIL_USERNAME" : "${var.sm_mail_user}",
      "MAIL_PASSWORD" : "${var.sm_mail_password}",
      "MAIL_ENCRYPTION" : "${var.sm_mail_encryption}",
      "MAIL_FROM_ADDRESS" : "${var.sm_mail_from_address}",
      "MAIL_FROM_NAME" : "${var.sm_mail_from_name}",
      #  Redis Database Keys
      "REDIS_HOST" : "${var.sm_redis_host}",
      "REDIS_PORT" : "${var.sm_redis_port}"
      "REDIS_PASSWORD" : "${var.sm_redis_password}",
      "REDIS_USERNAME" : "${var.sm_redis_user}",
      #  AWS Keys
      "AWS_PUBLIC_BUCKET" : "${var.sm_public_bucket}",
      "AWS_PRIVATE_BUCKET" : "${var.sm_private_bucket}",
      "AWS_DEFAULT_REGION" : "${var.sm_aws_region}",
      "AWS_BUCKET" : "${var.sm_bucket_name}"
    }
  )
}
