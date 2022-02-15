resource "aws_secretsmanager_secret" "secretmanager" {
  name = var.secretmanager_name

}

#   resource "aws_secretsmanager_secret_version" "sversion" {
#   secret_id = aws_secretsmanager_secret.secretmanager.id
#   secret_string = <<EOF
#    {
        # "AWS_KEY": var.AWS_KEY,
        # "AWS_SECRET": "value2",
        # "AWS_PUBLIC_BUCKET": "publicbucket",
        # "AWS_PRIVATE_BUCKET": "privatebucket",        
        # "DB_CONNECTION": "mysql",
        # "DB_HOST": "localhost",
        # "DB_PORT": "3306",
        # "DB_DATABASE": "test",
        # "DB_USERNAME": "test",
        # "DB_PASSWORD": "test",
        # "REDIS_HOST": "localhost",
        # "REDIS_PORT": "test"
#       }
# EOF
# }

## Method 2

# resource "aws_secretsmanager_secret_version" "sversion" {
#   secret_id = aws_secretsmanager_secret.secretmanager.id
#   secret_string = <<EOF
# {           
#   "AWS_PUBLIC_BUCKET": "${var.sm_public_bucket}",
#   "AWS_PRIVATE_BUCKET": "${var.sm_private_bucket}"
# EOF
# }

## Method 3 Working

# resource "random_password" "password" {
#   length           = 16
#   special          = true
#   override_special = "_%@"
# }

# # Creating a AWS secret versions for database master account (Masteraccoundb)
# resource "aws_secretsmanager_secret_version" "sversion" {
#   secret_id = aws_secretsmanager_secret.secretmanager.id
#   secret_string = <<EOF
#    {
#     "username": "adminaccount",
#     "password": "${random_password.password.result}"
#    }
# EOF
# }

# Method 4

 resource "aws_secretsmanager_secret_version" "sversion" {
   secret_id = aws_secretsmanager_secret.secretmanager.id
   secret_string = <<EOF
 {           
   "AWS_KEY": "${var.sm_iam_key}",
   "AWS_SECRET": "${var.sm_iam_secret}",
   "AWS_PUBLIC_BUCKET": "${var.sm_public_bucket}",
   "AWS_PRIVATE_BUCKET": "${var.sm_private_bucket}",   
   "DB_CONNECTION": "${var.sm_db_connection}",
   "DB_HOST": "${var.sm_db_host}",
   "DB_PORT": "${var.sm_db_port}",
   "DB_DATABASE": "${var.sm_db_name}",
   "DB_USERNAME": "${var.sm_db_user}",
   "DB_PASSWORD": "${var.sm_db_password}",
   "REDIS_HOST": "${var.sm_redis_host}",
   "REDIS_PORT": "${var.sm_redis_port}"
 }
EOF
}