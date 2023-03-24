output "codebuild_bucket" {
  value = aws_s3_bucket.codebuild_bucket.bucket
}

output "codebuild_bucket_arn" {
  value = aws_s3_bucket.codebuild_bucket.arn
}