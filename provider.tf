# terraform {
#   required_providers {
#     aws = {
#       source  = "registry.terraform.io/hashicorp/aws"
#       version = "= 3.74.0" ## or whatever version you need
#     }
#   }
# }

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 3.74.0"
    }
  }

  backend "s3" {
    bucket = "terraform-storage"
    key    = "production"
    region = "us-east-1"
    dynamodb_table = "dynamodb-terraform" 
    encrypt        = true
    profile = "profile-name" # Configure AWS profile on local
  }
}


# Configure the AWS Provider
provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
