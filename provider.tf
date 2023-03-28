# Configure the AWS Provider
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile_name
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.48.0"
    }
  }
}

# Method 1

# terraform {
#   backend "s3" {
#     encrypt        = true
#     key            = "terraform.tfstate"
#     bucket         = "backend-bucket" // You have to update S3 bucket name here
#     dynamodb_table = "dynamodb-table" // You have to update dynamodb table name here
#     region         = "ap-south-1"     // Update the region value as per your region
#     profile        = "profile-name"   // AWS profile name here
#   }
# }


# Method 2

# terraform {
#   backend "s3" {
#     key     = "terraform.tfstate"
#     bucket  = "terraform-sample-backend-bucket-2121" // You have to update S3 bucket name here
#     region  = "ap-south-1"                           // Update the region value as per your region
#     profile = "profile-name"                         // AWS profile name here
#   }
# }
