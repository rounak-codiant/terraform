resource "aws_s3_bucket" "public_bucket" {
  bucket        = var.public_bucket_name
  acl           = "public-read"
  force_destroy = true
  # acceleration_status = var.public_bucket_acceleration

  versioning {
    enabled = var.public_bucket_versioning
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = {
    Name        = "${var.project_name}-${var.public_bucket_name}"
    Environment = "${var.env_suffix}"
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
