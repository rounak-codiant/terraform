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
  instance_type      = var.instance_type
  ebs_volume_type    = var.ebs_volume_type
  ebs_volume_size    = var.ebs_volume_size
  key_pair_name      = var.key_pair_name
  project_name       = local.local_naming
  env_suffix         = local.environment
  vpc_id             = module.vpc.vpc_id
  ec2_monitoring     = var.ec2_monitoring
  ec2_policy_name    = var.ec2_policy_name
  ec2_role_name      = var.ec2_role_name
  ec2_subnet_id      = module.vpc.ec2_public_subnet
  php-version        = var.php-version
  node-version       = var.node-version
  composer-install   = var.composer-install
  php-nginx-config   = var.php-nginx-config
  php-module         = var.php-module
  nginx-nginx-config = var.nginx-nginx-config
  ami_name           = var.ami_name
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
  snapshot_identifier_name             = var.snapshot_identifier_name
  general_log                          = var.general_log
  slow_query_log                       = var.slow_query_log
  db_parameter_group_family            = var.db_parameter_group_family
  cluster_parameter_group_family       = var.cluster_parameter_group_family
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
  redis_subnets                    = module.vpc.public_subnet
  redis_user_name                  = var.redis_user_name
  redis_user_pwd                   = var.redis_user_pwd
  cachedb_name                     = var.cachedb_name
  cachedb_description              = var.cachedb_description
  version_upgrade                  = var.version_upgrade
  cachedb_engine                   = var.cachedb_engine
  cachedb_node_type                = var.cachedb_node_type
  cachedb_port                     = var.cachedb_port
  cachedb_snapshot_retention_limit = var.cachedb_snapshot_retention_limit
  snapshot_retention_limit         = var.snapshot_retention_limit
  rest_encryption_enabled          = var.rest_encryption_enabled
  transit_encryption_enabled       = var.transit_encryption_enabled
  automatic_failover_enabled       = var.automatic_failover_enabled
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
  alb_log_prefix              = var.alb_log_prefix
  alb_bucket_versioning       = var.alb_bucket_versioning
  alb_logs_bucket_name        = var.alb_logs_bucket_name
  alb_logs_enable             = var.alb_logs_enable
  alb_idle_timeout            = var.alb_idle_timeout
}

# ######################################### Secret Manager Module #########################################

module "secret_manager" {
  source = "./modules/SecretManagement"

  project_name       = local.local_naming
  env_suffix         = local.environment
  secretmanager_name = var.secretmanager_name

  #  Database Keys
  sm_db_connection = "mysql"
  sm_db_host       = "db_host_name"
  sm_db_read_host  = "db_read_host_name"
  sm_db_port       = "3306"
  sm_db_name       = var.database_name
  sm_db_user       = var.database_master_username
  sm_db_password   = var.database_master_password

  # SMTP Keys
  sm_mail_driver       = "smtp"
  sm_mail_host         = ""
  sm_mail_port         = "465"
  sm_mail_user         = ""
  sm_mail_password     = ""
  sm_mail_encryption   = "ssl"
  sm_mail_from_address = ""
  sm_mail_from_name    = ""

  #  AWS Keys
  sm_public_bucket  = var.public_bucket_name
  sm_private_bucket = var.private_bucket_name
  sm_aws_region     = var.aws_region
  sm_bucket_name    = var.public_bucket_name

  # Redis DB Keys
  sm_redis_host     = "redis_host_name"
  sm_redis_port     = "6379"
  sm_redis_user     = var.redis_user_name
  sm_redis_password = var.redis_user_pwd

  # sm_db_host        = module.database.database_cluster_host
  # sm_db_read_host  = ""
  # sm_redis_host     = module.cache_database.cache_cluster_host
}

########################################## Public CloudFront Module #########################################

module "public_cloudfront" {
  source = "./modules/CloudFront"
  depends_on = [
    module.public_bucket
  ]
  headers_policy_name    = var.public_headers_policy_name
  s3_bucket_domain_name  = module.public_bucket.public_bucket_domain_name
  s3_bucket_id           = module.public_bucket.public_bucket_name
  s3_bucket_arn          = module.public_bucket.public_bucket_arn
  objects_compress       = var.objects_compress
  ipv6_enabled           = var.ipv6_enabled
  http_version           = var.http_version
  min_ttl                = var.min_ttl
  default_ttl            = var.default_ttl
  max_ttl                = var.max_ttl
  cloudfront_description = var.public_cloudfront_description
}

########################################## Private CloudFront Module #########################################

module "private_cloudfront" {
  source = "./modules/CloudFront"
  depends_on = [
    module.private_bucket,
    module.public_cloudfront
  ]
  headers_policy_name    = var.private_headers_policy_name
  s3_bucket_domain_name  = module.private_bucket.private_bucket_domain_name
  s3_bucket_id           = module.private_bucket.private_bucket_name
  s3_bucket_arn          = module.private_bucket.private_bucket_arn
  objects_compress       = var.objects_compress
  ipv6_enabled           = var.ipv6_enabled
  http_version           = var.http_version
  min_ttl                = var.min_ttl
  default_ttl            = var.default_ttl
  max_ttl                = var.max_ttl
  cloudfront_description = var.private_cloudfront_description
}

########################################## CodeCommit Module #########################################

module "codecommit" {
  source = "./modules/CodeCommit"

  project_name           = local.local_naming
  env_suffix             = local.environment
  repository_name        = var.repository_name
  repository_description = var.repository_description
  codecommit_user_name   = var.codecommit_user_name
  iam_force_destroy      = var.iam_force_destroy
  repo_default_branch    = var.repo_default_branch
}


########################################## CodeBuild Module #########################################

module "codebuild" {
  source = "./modules/CodeBuild"
  depends_on = [
    module.codecommit
  ]

  project_name                  = local.local_naming
  env_suffix                    = local.environment
  codebuild_bucket_name         = var.codebuild_bucket_name
  codebuild_bucket_versioning   = var.codebuild_bucket_versioning
  codebuild_role_name           = var.codebuild_role_name
  codebuild_project_name        = var.codebuild_project_name
  codebuild_project_description = var.codebuild_project_description
  codebuild_image               = var.codebuild_image
  build_timeout                 = var.build_timeout
  codebuild_compute_type        = var.codebuild_compute_type
  repo_name                     = module.codecommit.codecommit_repo_name
  codebuild_source_branch       = module.codecommit.repo_branch
  codecommit_arn                = module.codecommit.repo_arn
}


########################################## CodeDeploy Module #########################################

module "codedeploy" {
  source = "./modules/CodeDeploy"
  depends_on = [
    module.load_balancer
  ]

  project_name                 = local.local_naming
  env_suffix                   = local.environment
  codedeploy_app_name          = var.codedeploy_app_name
  deployment_group_name        = var.deployment_group_name
  codedeploy_service_role_name = var.codedeploy_service_role_name
  instances_terminate_time     = var.instances_terminate_time
  target_group_name            = var.tg_name
}