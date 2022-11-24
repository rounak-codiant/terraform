# # Create KMS key
# resource "aws_kms_key" "backend_kms_key" {
#  deletion_window_in_days = 30
#  enable_key_rotation     = false
#  description             = "This key is used to encrypt bucket objects"
# }

# # Create KMS key`s alias
# resource "aws_kms_alias" "kms_key_alias" {
#  name          = "alias/kms-key"
#  target_key_id = aws_kms_key.backend_kms_key.key_id
# }

# # Create S3 Bucket for Terraform State
# resource "aws_s3_bucket" "backend_bucket" {
#  bucket = "backend-bucket"
#  acl    = "private"

#  versioning {
#    enabled = true
#  }

#  server_side_encryption_configuration {
#    rule {
#      apply_server_side_encryption_by_default {
#        kms_master_key_id = aws_kms_key.backend_kms_key.arn
#        sse_algorithm     = "aws:kms"
#      }
#    }
#  }
# }

# # Create DynamoDB Table
# resource "aws_dynamodb_table" "dynamodb_table" {
#  name           = "dynamodb-table"
#  read_capacity  = 30
#  write_capacity = 30
#  hash_key       = "LockID"

#  attribute {
#    name = "LockID"
#    type = "S"
#  }
# }

# # To store tfstate file
# terraform {
#  backend "s3" {
#    bucket         = "backend-bucket"
#    key            = "terraform.tfstate"
#    region         = "ap-south-1"
#    encrypt        = true
#    kms_key_id     = "alias/kms-key"
#    dynamodb_table = "dynamodb-table"
#    profile        = "profile-name" # Configure AWS profile on local
#  }
# }




# or Method 2


# # Create S3 Bucket
# resource "aws_s3_bucket" "backend_bucket" {
#   bucket = "backend-bucket"
#   acl    = "private"
#   versioning {
#     enabled = true
#   }

#   tags = {
#     Name        = "${var.project_name}-backend-bucket"
#     Environment = "${var.env_suffix}"
#   }
# }


# # Store trstate file
# terraform {
#   backend "s3" {
#     bucket = "backend-bucket"
#     key    = "terraform.tfstate"
#     region = "eu-west-2"
#     access_key = ""
#     secret_key = ""
#   }
# }