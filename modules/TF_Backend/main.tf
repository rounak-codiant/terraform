# Create the S3 bucket for storing Terraform state
#tfsec:ignore:aws-s3-enable-bucket-logging
resource "aws_s3_bucket" "terraform_backend_bucket" {
  bucket        = var.terraform_bucket_name
  force_destroy = true

  tags = {
    Name        = "${var.terraform_bucket_name}"
    Environment = "${var.env_suffix}"
  }
}

resource "aws_s3_bucket_acl" "private_bucket_acl" {
  bucket = aws_s3_bucket.terraform_backend_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "private_bucket_versioning" {
  bucket = aws_s3_bucket.terraform_backend_bucket.id
  versioning_configuration {
    status = var.terraform_bucket_versioning
  }
}

#tfsec:ignore:aws-s3-encryption-customer-key
resource "aws_s3_bucket_server_side_encryption_configuration" "private_bucket_encryption" {
  bucket = aws_s3_bucket.terraform_backend_bucket.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket                  = aws_s3_bucket.terraform_backend_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


# Create the DynamoDB Table for Terraform state locking
#tfsec:ignore:aws-dynamodb-table-customer-key
resource "aws_dynamodb_table" "terraform_backend" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  point_in_time_recovery {
    enabled = true
  }

  server_side_encryption {
    enabled = true // enabled server side encryption
  }
  attribute {
    name = "LockID" #To create a lock on the resource being modified.
    type = "S"
  }
}
