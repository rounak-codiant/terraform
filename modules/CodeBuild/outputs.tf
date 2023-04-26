output "codebuild_bucket" {
  description = "Name of the code build artifact store s3 bucket"
  value       = aws_s3_bucket.codebuild_bucket.bucket
}

output "codebuild_bucket_arn" {
  description = "ARN of the code build artifact store s3 bucket"
  value       = aws_s3_bucket.codebuild_bucket.arn
}
