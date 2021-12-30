resource "aws_secretsmanager_secret" "secretmanager" {
  name = var.secretmanager_name

}
  resource "aws_secretsmanager_secret_version" "sversion" {
  secret_id = aws_secretsmanager_secret.secretmanager.id
  secret_string = <<EOF
   {
        AWS_KEY = "value1"
        AWS_SECRET = "value2"
        AWS_PUBLIC_BUCKET = "value2"
        AWS_PRIVATE_BUCKET = "value2"
        DB_HOST = "value2"
        DB_HOST_READER = "value2"
        DB_PORT = "value2"
        DB_USERNAME = "value2"
        DB_PASSWORD = "value2"
        DB_DATABASE = "value2"
        REDIS_HOST = "value2"
        REDIS_PORT = "value2"
      }
EOF
}
