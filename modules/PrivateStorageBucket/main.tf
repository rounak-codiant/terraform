resource "aws_s3_bucket" "private_bucket" {
  bucket        = var.private_bucket_name
  force_destroy = true
  # acceleration_status = var.private_bucket_acceleration

  tags = {
    Name        = "${var.private_bucket_name}"
    Environment = "${var.env_suffix}"
  }
}

resource "aws_s3_bucket_acl" "private_bucket_acl" {
  bucket = aws_s3_bucket.private_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "private_bucket_versioning" {
  bucket = aws_s3_bucket.private_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "private_bucket_encryption" {
  bucket = aws_s3_bucket.private_bucket.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}



resource "aws_s3_bucket_public_access_block" "app" {
  bucket                  = aws_s3_bucket.private_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}