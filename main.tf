locals {
  local_naming = var.project_name
  environment  = var.env_suffix
}

######################################### VPC Module #########################################
module "vpc" {
  source = "./modules/VPC"

  public_cidr_block    = var.public_cidr_block
  private_cidr_block   = var.private_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  vpc_cidr_block       = var.vpc_cidr_block
  project_name         = local.local_naming
  env_suffix           = local.environment
}

# # ######################################## Application Server Module #########################################
# # You should also enable VPC Module for it.

module "application_server" {
  source = "./modules/ApplicationWebserver"
  depends_on = [
    module.vpc
  ]
  instance_type   = var.instance_type
  ebs_volume_type = var.ebs_volume_type
  ebs_volume_size = var.ebs_volume_size
  key_pair_name   = var.key_pair_name
  project_name    = local.local_naming
  env_suffix      = local.environment
  vpc_id          = module.vpc.vpc_id
  ec2_monitoring  = var.ec2_monitoring
  ec2_policy_name = var.ec2_policy_name
  ec2_role_name   = var.ec2_role_name
  ec2_subnet_id   = module.vpc.ec2_public_subnet
}


# ######################################### S3 Private Bucket Module #########################################

module "private_bucket" {
  source = "./modules/PrivateStorageBucket"

  project_name                = local.local_naming
  env_suffix                  = local.environment
  private_bucket_name         = var.private_bucket_name
  private_bucket_versioning   = var.private_bucket_versioning
  private_bucket_acceleration = var.private_bucket_acceleration
}

# ######################################### S3 Public Bucket Module #########################################

module "public_bucket" {
  source = "./modules/PublicStorageBucket"

  project_name               = local.local_naming
  env_suffix                 = local.environment
  public_bucket_name         = var.public_bucket_name
  public_bucket_versioning   = var.public_bucket_versioning
  public_bucket_acceleration = var.public_bucket_acceleration
}

# ######################################## IAM User Module #########################################

module "iam_user" {
  source = "./modules/IAM"
  depends_on = [
    module.public_bucket,
    module.private_bucket
  ]
  project_name       = local.local_naming
  env_suffix         = local.environment
  s3_iam_user_name   = var.s3_iam_user_name
  public_bucket_arn  = module.public_bucket.public_bucket_arn
  private_bucket_arn = module.private_bucket.private_bucket_arn
  # pgp_key            = var.pgp_key
}

# # ######################################### Database Module #########################################
# # # You should also enable VPC module with it.

module "database" {
  source = "./modules/Database"
  depends_on = [
    module.vpc
  ]
  database_vpc_id                      = module.vpc.vpc_id
  database_subnet_ids                  = module.vpc.private_subnet
  database_cluster_identifier          = var.database_cluster_identifier
  database_instance_identifier         = var.database_instance_identifier
  database_engine                      = var.database_engine
  database_cluster_engine_version      = var.database_cluster_engine_version
  database_name                        = var.database_name
  database_master_username             = var.database_master_username
  database_master_password             = var.database_master_password
  database_backup_retention_period     = var.database_backup_retention_period
  deletion_protection                  = var.deletion_protection
  storage_encrypted                    = var.storage_encrypted
  allow_major_version_upgrade          = var.allow_major_version_upgrade
  copy_tags_to_snapshot                = var.copy_tags_to_snapshot
  long_query_time                      = var.long_query_time
  max_allowed_packet                   = var.max_allowed_packet
  project_name                         = local.local_naming
  env_suffix                           = local.environment
  database_instance_class              = var.database_instance_class
  publicly_accessible                  = var.publicly_accessible
  cluster_parameter_group              = var.cluster_parameter_group
  db_instance_pg_name                  = var.db_instance_pg_name
  database_cluster_skip_final_snapshot = var.database_cluster_skip_final_snapshot
}

# # ######################################## Cache Database Module #########################################
# # You should also enable VPC module with it.

module "cache_database" {
  source = "./modules/CacheCluster"
  depends_on = [
    module.vpc
  ]
  project_name                     = local.local_naming
  env_suffix                       = local.environment
  redis_vpc_id                     = module.vpc.vpc_id
  redis_subnets                    = module.vpc.private_subnet
  redis_user_name                  = var.redis_user_name
  redis_user_pwd                   = var.redis_user_pwd
  cachedb_name                     = var.cachedb_name
  cachedb_description              = var.cachedb_description
  version_upgrade                  = var.version_upgrade
  cachedb_engine                   = var.cachedb_engine
  cachedb_node_type                = var.cachedb_node_type
  cachedb_port                     = var.cachedb_port
  cachedb_snapshot_retention_limit = var.cachedb_snapshot_retention_limit
}


######################################### Load Balancer Module #########################################
# # You should also enable ApplicationWebserver, VPC module with it.

module "load_balancer" {
  source = "./modules/LoadBalancer"
  depends_on = [
    module.application_server
  ]

  project_name                = local.local_naming
  env_suffix                  = local.environment
  alb_vpc_id                  = module.vpc.vpc_id
  lb_subnets                  = module.vpc.public_subnet
  tg_name                     = var.tg_name
  tg_port                     = var.tg_port
  tg_protocol                 = var.tg_protocol
  tg_target_type              = var.tg_target_type
  lb_tg_health_check_path     = var.lb_tg_health_check_path
  lb_tg_health_check_port     = var.lb_tg_health_check_port
  lb_tg_health_check_protocol = var.lb_tg_health_check_protocol
  lb_tg_health_check_matcher  = var.lb_tg_health_check_matcher
  lb_target_id                = module.application_server.web_instance_id
  lb_deletion_protection      = var.lb_deletion_protection
  alb_bucket_name             = var.alb_bucket_name
  lb_listener_protocol        = var.lb_listener_protocol
  lb_listener_port            = var.lb_listener_port
  lb_name                     = var.lb_name
  lb_internal                 = var.lb_internal
  lb_type                     = var.lb_type
}

# ######################################### Secret Manager Module #########################################

module "secret_manager" {
  source = "./modules/SecretManagement"

  project_name       = local.local_naming
  env_suffix         = local.environment
  secretmanager_name = var.secretmanager_name
  sm_public_bucket   = var.public_bucket_name
  sm_private_bucket  = var.private_bucket_name
  sm_db_connection   = ""
  sm_db_host         = ""
  sm_db_port         = "3306"
  sm_db_name         = var.database_name
  sm_db_user         = var.database_master_username
  sm_db_password     = var.database_master_password
  sm_redis_host      = ""
  sm_redis_port      = "6379"
  sm_iam_key         = ""
  sm_iam_secret      = ""

  # sm_public_bucket  = module.public_bucket.public_bucket_name
  # sm_private_bucket = module.private_bucket.private_bucket_name
  # sm_db_connection  = module.database.database_cluster_engine
  # sm_db_host        = module.database.database_cluster_host
  # sm_db_port        = module.database.database_cluster_port
  # sm_db_name        = module.database.database_cluster_database_name
  # sm_db_user        = module.database.database_cluster_user
  # sm_db_password    = module.database.database_cluster_password
  # sm_redis_host     = module.cache_database.cache_cluster_host
  # sm_redis_port     = "6379"
}
