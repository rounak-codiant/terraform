# Configure the AWS Provider
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile_name
  # access_key = var.aws_access_key
  # secret_key = var.aws_secret_key
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.74.0"
    }
  }
}


# Method 1

# terraform {
#   backend "s3" {
#     encrypt        = true
#     key            = "terraform.tfstate"
#     bucket         = "backend-bucket"    // You have to create S3 bucket manually and update here
#     dynamodb_table = "dynamodb-table"    // You have to create dynamodb table manually and update here
#     region         = "ap-south-1"        // Update the region value as per your region
#     profile        = "profile-name"     // Configure AWS profile on local
#   }
# }


# Method 2

# terraform {
#   backend "s3" {
#     key     = "terraform.tfstate"
#     bucket  = "backend-bucket"     // You have to create S3 bucket manually  
#     region  = "ap-south-1"         // Update the region value as per your region
#     profile = "profile-name"       // Configure AWS profile on local
#   }
# }