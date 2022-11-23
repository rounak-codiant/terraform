locals {
  local_naming = var.project_name
  environment  = terraform.workspace
}

######################################### VPC Module #########################################
module "vpc" {
  source = "./modules/VPC"

  public_cidr_block      = var.public_cidr_block
  private_cidr_block     = var.private_cidr_block
  vpc_availability_zones = var.vpc_availability_zones
  vpc_instance_tenancy   = var.vpc_instance_tenancy
  enable_dns_hostnames   = var.enable_dns_hostnames
  vpc_cidr_block         = var.vpc_cidr_block
  project_name           = local.local_naming
  env_suffix             = local.environment
}

# ######################################## Application Server Module #########################################
# You should also enable IAM, VPC Module with it.

module "application_server" {
  source = "./modules/ApplicationWebserver"

  instance_type        = var.instance_type
  ebs_volume_type      = var.ebs_volume_type
  ebs_volume_size      = var.ebs_volume_size
  key_pair_name        = var.key_pair_name
  project_name         = local.local_naming
  env_suffix           = local.environment
  vpc_id               = module.vpc.vpc_id
  iam_instance_profile = module.iam_user.iam_instance_profile_name
}

# ######################################## IAM User Module #########################################
# You should also enable ApplicationWebserver, public_bucket, private_bucket module with it.

module "iam_user" {
  source = "./modules/IAM"

  project_name       = local.local_naming
  env_suffix         = local.environment
  s3_iam_user_name   = var.s3_iam_user_name
  public_bucket_arn  = module.public_bucket.public_bucket_arn
  private_bucket_arn = module.private_bucket.private_bucket_arn
#   # # pgp_key            = var.pgp_key
#   # # s3_iam_secret_key  = module.private_bucket.iam_access_key_s3_user
}


# ######################################### S3 Private Bucket Module #########################################
# You should also enable IAM module with it.

module "private_bucket" {
  source = "./modules/PrivateStorageBucket"
  # depends_on = [
  #   module.application_server
  # ]
  private_bucket_name         = var.private_bucket_name
  private_bucket_versioning   = var.private_bucket_versioning
  private_bucket_acceleration = var.private_bucket_acceleration
  project_name                = local.local_naming
  env_suffix                  = local.environment
}

# ######################################### S3 Public Bucket Module #########################################
# You should also enable IAM module with it.

module "public_bucket" {
  source = "./modules/PublicStorageBucket"
  # depends_on = [
  #   module.private_bucket
  # ]
  # 
  public_bucket_name         = var.public_bucket_name
  public_bucket_versioning   = var.public_bucket_versioning
  public_bucket_acceleration = var.public_bucket_acceleration
  project_name               = local.local_naming
  env_suffix                 = local.environment
}

# ######################################### Database Module #########################################
# You should also enable VPC module with it.

module "database" {
  source = "./modules/Database"
  # depends_on = [
  #   module.application_server
  # ]
  database_vpc_id                 = module.vpc.vpc_id
  database_subnet_ids             = module.vpc.private_subnet
  database_cluster_identifier     = var.database_cluster_identifier
  database_instance_identifier    = var.database_instance_identifier
  database_engine                 = var.database_engine
  database_cluster_engine_version = var.database_cluster_engine_version
  database_name                        = var.database_name
  database_master_username             = var.database_master_username
  database_master_password             = var.database_master_password
  database_backup_retention_period     = var.database_backup_retention_period
  deletion_protection                  = var.deletion_protection
  storage_encrypted                    = var.storage_encrypted
  allow_major_version_upgrade          = var.allow_major_version_upgrade
  copy_tags_to_snapshot                = var.copy_tags_to_snapshot
  project_name                         = local.local_naming
  env_suffix                           = local.environment
  database_application_sg              = module.application_server.application_sg_id
  # allocated_storage                    = var.allocated_storage
  database_instance_class              = var.database_instance_class
  publicly_accessible                  = var.publicly_accessible
  database_cluster_skip_final_snapshot = var.database_cluster_skip_final_snapshot
}

# ######################################## Cache Database Module #########################################
# # 
# module "cache_database" {
#   source = "./modules/CacheCluster"
#   depends_on = [
#     module.database
#   ]
#   # 
#   cachedb_name                     = var.cachedb_name
#   cachedb_description              = var.cachedb_description
#   cachedb_engine                   = var.cachedb_engine
#   cachedb_engine_version           = var.cachedb_engine_version
#   cachedb_node_type                = var.cachedb_node_type
#   num_cache_nodes                  = var.num_cache_nodes
#   cachedb_az_mode                  = var.cachedb_az_mode
#   cachedb_port                     = var.cachedb_port
#   cachedb_snapshot_retention_limit = var.cachedb_snapshot_retention_limit
#   # 
#   project_name = local.local_naming
#   env_suffix   = local.environment
#   # 
# }

# ######################################### Secret Manager Module #########################################
# # 
# module "secret_manager" {
#   source = "./modules/SecretManagement"
#   # depends_on = [
#   #   module.database
#   # ]
#   # 
#   secretmanager_name = var.secretmanager_name
#   # 
#   sm_iam_key    = module.iam_user.s3_iam_access_key
#   sm_iam_secret = module.iam_user.s3_iam_secret_key
#   # 
#   sm_public_bucket  = module.public_bucket.public_bucket_name
#   sm_private_bucket = module.private_bucket.private_bucket_name
#   # 
#   sm_db_connection = module.database.database_cluster_engine
#   sm_db_host       = module.database.database_cluster_host
#   sm_db_port       = module.database.database_cluster_port
#   sm_db_name       = module.database.database_cluster_database_name
#   sm_db_user       = module.database.database_cluster_user
#   sm_db_password   = module.database.database_cluster_password
#   # 
#   sm_redis_host = module.cache_database.cache_cluster_host
#   sm_redis_port = "6379"
#   # 
# }

# ######################################### Load Balancer Module #########################################
# # # You should also enable ApplicationWebserver, VPC module with it.

module "load_balancer" {
  source = "./modules/LoadBalancer"
  # depends_on = [
  #   module.application_server
  # ]
  # 
  alb_vpc_id     = module.vpc.vpc_id
  lb_subnets     = module.vpc.public_subnet
  tg_name        = var.tg_name
  tg_port        = var.tg_port
  tg_protocol    = var.tg_protocol
  tg_target_type = var.tg_target_type

  lb_tg_health_check_path     = var.lb_tg_health_check_path
  lb_tg_health_check_port     = var.lb_tg_health_check_port
  lb_tg_health_check_protocol = var.lb_tg_health_check_protocol
  lb_tg_health_check_matcher  = var.lb_tg_health_check_matcher
  lb_target_id                = module.application_server.web_instance_id
  lb_deletion_protection      = var.lb_deletion_protection

  lb_access_logs        = var.lb_access_logs
  lb_access_logs_bucket = var.lb_access_logs_bucket
  lb_access_logs_prefix = var.lb_access_logs_prefix

  lb_listener_protocol = var.lb_listener_protocol
  lb_listener_port     = var.lb_listener_port

  lb_name     = var.lb_name
  lb_internal = var.lb_internal
  lb_type     = var.lb_type

  project_name = local.local_naming
  env_suffix   = local.environment
}