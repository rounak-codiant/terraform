resource "aws_s3_bucket" "private_bucket" {
  bucket        = var.private_bucket_name
  acl           = "private"
  force_destroy = true
  # acceleration_status = var.private_bucket_acceleration

  versioning {
    enabled = var.private_bucket_versioning
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name        = "${var.private_bucket_name}"
    Environment = "${var.env_suffix}"
  }
}

resource "aws_s3_bucket_public_access_block" "app" {
  bucket                  = aws_s3_bucket.private_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}