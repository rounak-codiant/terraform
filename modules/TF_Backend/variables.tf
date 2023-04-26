variable "env_suffix" {
  description = "To define project environment"
}

variable "terraform_bucket_name" {
  description = "To define s3 bucket name for terraform backend"
}

variable "terraform_bucket_versioning" {
  description = "To define s3 bucket versioning option"
}

variable "table_name" {
  description = "To define dynamodb table name for terraform backend"
}
