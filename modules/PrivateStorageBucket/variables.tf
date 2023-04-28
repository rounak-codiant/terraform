variable "env_suffix" {
  description = "Define project environment"
}

variable "private_aws_profile_name" {
  description = "Name of the AWS profile"
}

variable "private_bucket_name" {
  description = "Name of the private bucket"
}

variable "private_bucket_versioning" {
  description = "Private bucket versioning option"
}

variable "private_bucket_acceleration" {
  description = "Private bucket acceleration option"
}

variable "private_destination_bucket_name" {
  description = "Private bucket replica bucket name"
}

variable "private_bucket_replication_option" {
  description = "Private bucket replica option"
}

variable "private_replication_destination_region" {
  description = "Private bucket replica bucket region"
}

variable "private_bucket_lifecycle_rule" {
  default     = "Disabled"
  description = "Private bucket bucket lifecycle rule option"
}
