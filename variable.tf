# AWS Provider Key
variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "aws_region" {
  default = "us-east-2"
}

# Backend setup
variable "backend_bucket_name" {
  default = "backend-bucket"
}

variable "tfstatefile_keyname" {
  default = "tfstate_file_name"
}

variable "backend_bucket_region" {
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

variable "key_pair_name" {
  default = "Key-Pair-Name"
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

variable "database_cluster_engine_version" {
  default = "5.7.mysql_aurora.2.07.2"
}

variable "database_instance_identifier" {
  default = "database-instance"
}

variable "database_cluster_skip_final_snapshot" {
  default = "true"
}

variable "database_engine" {
  default = "aurora-mysql"
  # allowed_values = ["aurora", "aurora-mysql", "aurora-postgresql", "mysql"]
}
# variable "database_cluster_engine_mode" {
#     default = "provisioned"
# }
variable "database_engine_version" {
  default = "5.7.mysql_aurora.2.07.2"
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

variable "deletion_protection" {
  default = "true"
}

variable "storage_encrypted" {
  default = "true"
}

variable "database_application_sg" {
  default = ""
}

variable "allow_major_version_upgrade" {
  default = "false"
}

variable "copy_tags_to_snapshot" {
  default = "true"
}

variable "enabled_cloudwatch_logs_exports" {
  type    = list(string)
  default = ["error", "general", "audit"]
}

variable "allocated_storage" {
  default = "10"
}

variable "database_instance_class" {
  default = "t3.medium"
}

variable "publicly_accessible" {
  default = "false"
}

#Cache Database (Redis)

variable "cachedb_engine" {
  default = "redis"
}
variable "cachedb_name" {
  default = "redis-instance-name"
}
variable "cachedb_description" {
  default = "redis-instance-description"
}

variable "cachedb_engine_version" {
  default = "5.0.6"
}

variable "cachedb_port" {
  default = "6379"
}

variable "cachedb_node_type" {
  default = "cache.t3.medium"
}

variable "num_cache_nodes" {
  default = "1"
}

variable "cachedb_az_mode" {
  default = "single-az"
}

variable "cachedb_snapshot_retention_limit" {
  default = "1"
}

# IAM User

variable "s3_iam_user_name" {
  default = "s3-user"
}

variable "pgp_key" {
  default = "keybase:demo"
}


# Secret Manager

variable "secretmanager_name" {
  default = "secretmanager"
}

# variable "sm_public_bucket" {
# }


# variable "sm_private_bucket" {
# }
