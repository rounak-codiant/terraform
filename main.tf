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
    depends_on = [
      module.application_server
    ]

  private_bucket_name = var.private_bucket_name
  private_bucket_versioning = var.private_bucket_versioning
  private_bucket_acceleration = var.private_bucket_acceleration
  project_name = var.project_name
  env_suffix = var.env_suffix
}

######################################### S3 Public Bucket Module #########################################
module "public_bucket" {
  source = "./modules/PublicStorageBucket"
    depends_on = [
      module.private_bucket
    ]

  public_bucket_name = var.public_bucket_name
  public_bucket_versioning = var.public_bucket_versioning
  public_bucket_acceleration = var.public_bucket_acceleration
  project_name = var.project_name
  env_suffix = var.env_suffix
}

######################################### Database Module #########################################
module "database" {
  source = "./modules/Database"
    depends_on = [
      module.public_bucket
    ]


  database_cluster_identifier = var.database_cluster_identifier
  database_engine             = var.database_engine
  # database_cluster_engine_mode = var.database_cluster_engine_mode
  database_name               = var.database_name
  database_master_username    = var.database_master_username
  database_master_password     = var.database_master_password
  database_backup_retention_period = var.database_backup_retention_period
  deletion_protection         = var.deletion_protection
  storage_encrypted           = var.storage_encrypted
  allow_major_version_upgrade = var.allow_major_version_upgrade
  copy_tags_to_snapshot       = var.copy_tags_to_snapshot
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  project_name                = var.project_name
  env_suffix                  = var.env_suffix

  allocated_storage           = var.allocated_storage
  database_instance_class     = var.database_instance_class
  publicly_accessible         = var.publicly_accessible
}

######################################### Cache Database Module #########################################

module "cache_database" {
  source = "./modules/CacheCluster"
    depends_on = [
      module.database
    ]  

  cachedb_engine                   = var.cachedb_engine
  cachedb_node_type                = var.cachedb_node_type
  num_cache_nodes                  = var.num_cache_nodes
  cachedb_az_mode                  = var.cachedb_az_mode
  cachedb_snapshot_retention_limit = var.cachedb_snapshot_retention_limit

}

######################################### Secret Manager Module #########################################

module "secret_manager" {
  source = "./modules/SecretManagement"
    depends_on = [
      module.cache_database
    ]

  secretmanager_name = var.secretmanager_name

}