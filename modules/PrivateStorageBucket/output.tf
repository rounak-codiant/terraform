output "private_bucket_name" {
  description = "private Bucket Name"
  value       = aws_s3_bucket.private_bucket.id
}

output "private_bucket_region" {
  description = "private Bucket Region"
  value       = aws_s3_bucket.private_bucket.region
}

output "private_bucket_arn" {
  value = aws_s3_bucket.private_bucket.arn
}