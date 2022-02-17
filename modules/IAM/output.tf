output "s3_iam_access_key" {
    value = aws_iam_user.s3_user.id
}

output "s3_iam_secret_key" {
  value = aws_iam_access_key.s3_user_access.encrypted_secret
  sensitive = true
}

# output "s3_iam_secret_key" {
#     value = aws_iam_user.s3_user.encrypted_secret
#     sensitive   = true
# }