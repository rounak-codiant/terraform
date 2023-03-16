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
    status = var.public_bucket_versioning
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

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket                  = aws_s3_bucket.public_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}