# module aws_modules {
#   source  = "./modules/ec2.tf"
# }

locals {
  local_naming = "${var.project_name}-${var.env_suffix}"
}

######################################### Application Server Module #########################################
module "application_server" {
  source = "./modules/ApplicationWebserver"
  
  instance_type = var.instance_type
  ebs_volume_type = var.ebs_volume_type
  ebs_volume_size = var.ebs_volume_size
  key_pair_location = var.key_pair_location
  project_name = var.project_name
  env_suffix = var.env_suffix

  # tags = {
  #   Name = var.local_naming
  # }

}

######################################### S3 Private Bucket Module #########################################
module "private_bucket" {
  source = "./modules/PrivateStorageBucket"

  private_bucket_name = var.private_bucket_name
  private_bucket_versioning = var.private_bucket_versioning
  private_bucket_acceleration = var.private_bucket_acceleration
  project_name = var.project_name
  env_suffix = var.env_suffix
}

######################################### S3 Public Bucket Module #########################################
module "public_bucket" {
  source = "./modules/PublicStorageBucket"

  public_bucket_name = var.public_bucket_name
  public_bucket_versioning = var.public_bucket_versioning
  public_bucket_acceleration = var.public_bucket_acceleration
  project_name = var.project_name
  env_suffix = var.env_suffix
}

######################################### Database Module #########################################
module "database" {
  source = "./modules/Database"

  database_cluster_identifier = var.database_cluster_identifier
  database_engine = var.database_engine
  database_name = var.database_name
  database_master_username = var.database_master_username
  database_master_password = var.database_master_password
  database_backup_retention_period = var.database_backup_retention_period
  project_name = var.project_name
  env_suffix = var.env_suffix
}

# module "cloudfront-s3-cdn_example_complete" {
#   source  = "cloudposse/cloudfront-s3-cdn/aws//examples/complete"
#   version = "0.77.0"
#   # insert the 14 required variables here
# }