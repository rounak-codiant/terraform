output "public_bucket_name" {
    description = "Public Bucket Name"
    value = aws_s3_bucket.public_bucket.id
}

output "public_bucket_region" {
    description = "Public Bucket Region"
    value = aws_s3_bucket.public_bucket.region
}

output "public_bucket_arn" {
    value = aws_s3_bucket.public_bucket.arn
}