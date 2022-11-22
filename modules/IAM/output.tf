output "s3_iam_access_key" {
  value = aws_iam_user.s3_user.id
}

output "s3_iam_secret_id" {
  value     = aws_iam_access_key.s3_user_access.id
  sensitive = true
}

output "s3_iam_encrypted_secret" {
  value     = aws_iam_access_key.s3_user_access.encrypted_secret
  sensitive = true
}

output "iam_instance_profile_name" {
  value = aws_iam_instance_profile.ec2_profile.name
}