resource "aws_s3_bucket" "public_bucket" {
  bucket        = var.public_bucket_name
  force_destroy = true
  # acceleration_status = var.public_bucket_acceleration

  tags = {
    Name        = "${var.public_bucket_name}"
    Environment = "${var.env_suffix}"
  }
}

resource "aws_s3_bucket_acl" "public_bucket_acl" {
  bucket = aws_s3_bucket.public_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "public_bucket_versioning" {
  bucket = aws_s3_bucket.public_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "public_bucket_encryption" {
  bucket = aws_s3_bucket.public_bucket.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_policy" "public_bucket_policy" {
  bucket = aws_s3_bucket.public_bucket.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression's result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "MyPublicBucketPolicy"
    Statement = [
      {
        Sid       = "ReadOnlyPublicAccess"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = [
          "${aws_s3_bucket.public_bucket.arn}/*"
        ]
      },
    ]
  })
}
