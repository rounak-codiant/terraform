resource "aws_s3_bucket" "private_bucket" {
  bucket = var.private_bucket_name
  acl    = "private"
  acceleration_status = var.private_bucket_acceleration
  versioning {
    enabled = var.private_bucket_versioning
        }
  server_side_encryption_configuration {
    rule {
     apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
     }
    }
  }

  tags = {
    Name        = var.project_name
    Environment = var.env_suffix
  }
}
