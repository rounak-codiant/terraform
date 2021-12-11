resource "aws_s3_bucket" "private_bucket" {
  bucket = var.private_bucket_name
  acl    = "private"
  versioning {
    enabled = var.private_bucket_versioning
        }

  tags = {
    Name        = var.project_name
    Environment = var.env_suffix
  }
}