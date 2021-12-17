# AWS Provider Key
variable aws_access_key {}

variable aws_secret_key {}

variable aws_region {
  default = "us-east-2"
}

#Project and variable
variable "project_name" {
  default = "TerraformProject"
}

variable "env_suffix" {
  default = "dev"
}
#EC2
variable "instance_type" {
  default = "t2.micro"
}

variable "ebs_volume_type" {
  default = "gp2"
}
variable "ebs_volume_size" {
  default = "30"
}
variable "key_pair_location" {
  default = "~/.ssh/id_rsa.pub"
}

#S3 Private Bucket
variable "private_bucket_name" {
    default = "codiant-private-bucket-terraform-1"
}

variable "private_bucket_versioning" {
    default = "true"
}

variable "private_bucket_acceleration" {
    default = "Suspended"
}

#S3 Public Bucket
variable "public_bucket_name" {
    default = "codiant-public-bucket-terraform-1"
}

variable "public_bucket_versioning" {
    default = "true"
}

variable "public_bucket_acceleration" {
    default = "Suspended"
}

#Database (RDS)
variable "database_cluster_identifier" {
    default = "database-cluster"
}
variable "database_engine" {
    default = "aurora"
}
variable "database_name" {
    default = "database_name"
}
variable "database_master_username" {
    default = "admin"
}
variable "database_master_password" {
    default = "admin@password"
}

variable "database_backup_retention_period" {
    default = "7"
}
