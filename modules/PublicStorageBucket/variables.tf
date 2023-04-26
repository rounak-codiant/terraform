variable "env_suffix" {
  description = "Define project environment"
}

variable "public_aws_profile_name" {
  description = "Name of the AWS profile"
}

variable "public_bucket_name" {
  description = "Name of the public bucket"
}

variable "public_bucket_versioning" {
  description = "Public bucket versioning option"
}

variable "public_bucket_acceleration" {
  description = "Public bucket acceleration option"
}

variable "public_destination_bucket_name" {
  description = "Public bucket replica bucket name"
}

variable "public_bucket_replication_option" {
  description = "Public bucket replica option"
}

variable "public_replication_destination_region" {
  description = "Public bucket replica bucket region"
}
