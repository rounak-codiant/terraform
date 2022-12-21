output "s3_iam_user_id" {
  value = aws_iam_access_key.s3_user_access.id
}

output "s3_iam_user_secret" {
  value = aws_iam_access_key.s3_user_access.secret
}

