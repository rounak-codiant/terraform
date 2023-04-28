# AWS Provider Key
variable "aws_profile_name" {
  description = "Name of the AWS profile"
  default     = ""
}

variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

#Project and variable
variable "project_name" {
  description = "Name of your project"
  default     = "Terraform-Project"
}

variable "env_suffix" {
  description = "Project environment"
  default     = "test"
}

#Terraform Backend Module
variable "terraform_bucket_name" {
  type        = string
  default     = "terraform-sample-backend-bucket"
  description = "Terrafrom backend bucket name"
}

variable "terraform_bucket_versioning" {
  type        = string
  default     = "Enabled"
  description = "Terrafrom backend bucket versioning Enabled or Disabled"
}

variable "table_name" {
  type        = string
  default     = "terraform-backend-sample-tablename"
  description = "Terrafrom backend dynamoDB table name"
}

# #VPC
variable "vpc_cidr_block" {
  default     = "20.0.0.0/16"
  description = "Main VPC CIDR Block"
}

variable "public_cidr_block" {
  type        = list(string)
  default     = ["20.0.0.0/20", "20.0.16.0/20", "20.0.32.0/20"]
  description = "Public subnet CIDR blocks"
}

variable "private_cidr_block" {
  type        = list(string)
  default     = ["20.0.48.0/20", "20.0.64.0/20", "20.0.80.0/20"]
  description = "Private subnet CIDR blocks"
}

variable "enable_dns_hostnames" {
  default     = "true"
  description = "DNS hostnames in the VPC"
}

#EC2
variable "instance_type" {
  description = "Application server instance type"
  default     = "t2.micro"
}

variable "ebs_volume_type" {
  description = "EC2 EBS type"
  default     = "gp2"
}
variable "ebs_volume_size" {
  default     = "30"
  description = "EBS Storage Capacity/Size"
}

variable "key_pair_name" {
  default     = "pemkey"
  description = "Name of EC2 SSh Key Pair"
}

variable "ec2_role_name" {
  description = "Instance IAM role name"
  default     = "ec2-role"
}

variable "ec2_policy_name" {
  description = "Instance IAM policy name"
  default     = "ec2-role-policy"
}

variable "ec2_monitoring" {
  description = "Instance monitoring option"
  default     = "true"
}

variable "php_version" {
  default     = "8.1"
  description = "PHP version to install on server"
}

variable "node_version" {
  description = "Node version to install on server"
  default     = "16"
}

variable "composer_install" {
  description = "Composer install on server or not"
  default     = "yes"
}

variable "php_nginx_config" {
  description = "Nginx configuration for PHP"
  default     = "yes"
}

variable "php_module" {
  description = "PHP module install or not"
  default     = "yes"
}

variable "node_nginx_config" {
  description = "Nginx configuration for Node"
  default     = "no"
}

variable "ami_name" {
  description = "Instance AMI"
  default     = "ubuntu/images/hvm-ssd/ubuntu-jammy-*arm64"
}

# #S3 Private Bucket
variable "private_bucket_name" {
  description = "Name of the private bucket"
  default     = "private-bucket-terraform-1"
}

variable "private_bucket_acceleration" {
  description = "Private bucket acceleration option"
  default     = "Suspended"
}

variable "private_bucket_versioning" {
  default     = "Enabled"
  description = "Private bucket versioning Enabled/Disabled"
}

variable "private_destination_bucket_name" {
  description = "Private bucket replica bucket name"
  default     = "private-bucket-replica-bucket"
}

variable "private_bucket_replication_option" {
  default     = "Enabled"
  description = "Private bucket replica Enabled/Disabled"
}

variable "private_replication_destination_region" {
  description = "Private bucket replica region"
  default     = "us-east-2"
}

variable "private_bucket_lifecycle_rule" {
  default     = "Disabled"
  description = "Private bucket bucket lifecycle rule option"
}

# #S3 Public Bucket
variable "public_bucket_name" {
  description = "Name of the public bucket"
  default     = "public-bucket-terraform-1"
}

variable "public_bucket_acceleration" {
  description = "Public bucket acceleration option"
  default     = "Suspended"
}

variable "public_bucket_versioning" {
  default     = "Enabled"
  description = "Public bucket versioning Enabled/Disabled"
}

variable "public_destination_bucket_name" {
  description = "Public bucket replica bucket name"
  default     = "public-bucket-replica-bucket"
}

variable "public_bucket_replication_option" {
  default     = "Enabled"
  description = "Public bucket replica Enabled/Disabled"
}

variable "public_replication_destination_region" {
  description = "Public bucket replica region"
  default     = "us-east-2"
}

variable "public_bucket_lifecycle_rule" {
  default     = "Disabled"
  description = "Public bucket bucket lifecycle rule option"
}

# #Database (RDS)
variable "database_cluster_identifier" {
  description = "Database cluster name"
  default     = "database-cluster"
}

variable "database_cluster_engine_version" {
  description = "Database cluster engine"
  default     = "5.7.mysql_aurora.2.07.2"
}

variable "database_instance_identifier" {
  description = "Database instance name"
  default     = "database-instance"
}

variable "database_cluster_skip_final_snapshot" {
  description = "Databse cluster final snapshot true/false"
  default     = "true"
}

variable "database_engine" {
  description = "Database engine"
  default     = "aurora-mysql"
  # allowed_values = ["aurora", "aurora-mysql", "aurora-postgresql", "mysql"]
}

# variable "database_cluster_engine_mode" {
#     default = "provisioned"
# }

variable "database_name" {
  description = "Database name"
  default     = "database_name"
}
variable "database_master_username" {
  description = "Database master username"
  default     = "admin"
}

variable "database_master_password" {
  description = "Database master password"
  default     = "admin@password"
}

variable "database_backup_retention_period" {
  description = "Database backup retention time"
  default     = "7"
}

variable "deletion_protection" {
  description = "Database cluster delete protection"
  default     = "true"
}

variable "storage_encrypted" {
  description = "Database stotage encryption"
  default     = "true"
}

variable "allow_major_version_upgrade" {
  description = "Database version upgrade"
  default     = "false"
}

variable "copy_tags_to_snapshot" {
  description = "Databse snapshot tag as cluster"
  default     = "true"
}

variable "snapshot_identifier_name" {
  description = "Database snapshot name"
  default     = "db-snap"
}

# variable "allocated_storage" {
#   default = "10"
# }

variable "database_instance_class" {
  description = "Database instance type"
  default     = "db.t3.medium"
}

variable "publicly_accessible" {
  description = "Database can be access publicly"
  default     = "false"
}

variable "cluster_parameter_group" {
  description = "Database cluster parameter group name"
  default     = "cluster-parameter-group"
}

variable "db_instance_pg_name" {
  description = "Database instance parameter group name"
  default     = "db-instance-parameter-group"
}

variable "long_query_time" {
  description = "Maximum time to run long query"
  default     = "10" #10 second
}

variable "max_allowed_packet" {
  description = "Maximum allowed packet"
  default     = "64000000" #64MB
}

variable "general_log" {
  description = "Database general log monitoring"
  default     = "1"
}

variable "slow_query_log" {
  description = "Database slow log monitoring"
  default     = "1"
}

variable "db_parameter_group_family" {
  description = "Database instance parameter group family"
  default     = "aurora-mysql5.7"
}

variable "cluster_parameter_group_family" {
  description = "Database cluster parameter group family"
  default     = "aurora-mysql5.7"
}


# # Elastic Cache (Redis)
variable "redis_user_name" {
  description = "Redis database username"
  default     = "redis"

}
variable "redis_user_pwd" {
  description = "Redis database password"
  type        = string
  default     = "dm3YbhsFqa1P121KEC"
}

variable "cachedb_engine" {
  description = "Cache database engine"
  default     = "redis"
}
variable "cachedb_name" {
  description = "Cache database cluster name"
  default     = "redis-cache"
}

variable "cachedb_description" {
  description = "Cache database cluster description"
  default     = "Redis Database"
}

variable "cachedb_port" {
  description = "Port number for cache database server"
  default     = "6379"
}

variable "cachedb_node_type" {
  description = "Cache database cluster node type"
  default     = "cache.t3.small"
}

variable "version_upgrade" {
  description = "Cache database version upgrade"
  default     = "false"
}

variable "snapshot_retention_limit" {
  description = "Number of days for cache cluster snapshots"
  default     = "7"
}

variable "rest_encryption_enabled" {
  description = "Enable rest encryption for cluster"
  default     = "true"
}

variable "transit_encryption_enabled" {
  description = "Enable transit encryption for cluster"
  default     = "true"
}

variable "automatic_failover_enabled" {
  description = "Read-only replica promoted to read/write primary if the existing primary fails"
  default     = "false"
}

# # Secret Manager
variable "secretmanager_name" {
  description = "Name of the secret manager"
  default     = "secretmanager"
}

#ALB (Application Load Balancer)
#Target Group
variable "tg_name" {
  description = "Name of the target group"
  default     = "default-tg"
}

variable "tg_port" {
  description = "Target group port"
  default     = "80"
}

variable "tg_protocol" {
  description = "Target group protocol"
  default     = "HTTP"
}

variable "tg_target_type" {
  description = "Target group target type"
  default     = "instance"
}

# Health Check
variable "lb_tg_health_check_path" {
  description = "Target group health check path"
  default     = "/"
}

variable "lb_tg_health_check_port" {
  description = "Target group health check port"
  default     = "80"
}

variable "lb_tg_health_check_protocol" {
  description = "Target group health check protocol"
  default     = "HTTP"
}

variable "lb_tg_health_check_matcher" {
  description = "Target group health check status code"
  default     = "200"
}


# Load Balancer
variable "lb_name" {
  description = "Name of the load balancer"
  default     = "alb-terraform-1"
}

variable "lb_internal" {
  description = "false value will create public load balancer and true value will create internal load balancer"
  default     = "false"
}

variable "lb_type" {
  description = "Load balancer type. Valid values are 'application' or 'network'"
  default     = "application"
}

variable "lb_deletion_protection" {
  description = "Enable load balancer delete protection"
  default     = "true"
}

# Load Balancer Listener
variable "lb_listener_protocol" {
  description = "Load balancer listener protocol"
  default     = "HTTP"
}

variable "lb_listener_port" {
  description = "Load balancer listener port"
  default     = "80"
}

variable "alb_log_prefix" {
  description = "Load balancer logs prefix"
  default     = "ALB"
}

variable "alb_bucket_versioning" {
  description = "Load lalancer logs s3 bucket versioning"
  default     = "Enabled"
}

variable "alb_logs_bucket_name" {
  description = "Load balancer logs s3 bucket name"
  default     = "alb-logs-bucket"
}

variable "alb_logs_enable" {
  description = "Enable load balancer access logs"
  default     = "true"
}

variable "alb_idle_timeout" {
  description = "Load balancer maximum idle timeout"
  default     = "120"
}

#CDN
variable "public_headers_policy_name" {
  description = "Public cloudfront security headers policy name"
  default     = "CustomHeadersPolicy"
}

variable "private_headers_policy_name" {
  description = "Private cloudfront security headers policy name"
  default     = "CustomHeadersPolicy"
}

variable "objects_compress" {
  description = "Enable objects compress"
  default     = "true"
}

variable "ipv6_enabled" {
  description = "Whether the IPv6 is enabled for the distribution"
  default     = "true"
}

variable "http_version" {
  default     = "http2and3"
  description = "We can use (http1.1, http2, http2and3, http3)"
}

variable "public_cloudfront_description" {
  description = "Public CloudFront distribution description"
  default     = "Public CloudFront Distribution"
}

variable "private_cloudfront_description" {
  description = "Private CloudFront distribution description"
  default     = "Private CloudFront Distribution"
}

variable "public_permissions_policy" {
  description = "Security headers permissions policies"
  default     = "accelerometer=(self), camera=(self), cross-origin-isolated=(self), encrypted-media=(self), geolocation=(self), microphone=(self), interest-cohort=()"
}

variable "public_access_control_allow_origins" {
  description = "Define access control origins"
  default     = "*.test.com"
}

variable "public_content_security_policy" {
  description = "Security headers content security policies"
  default     = "default-src 'none'; img-src 'self'; script-src 'self'; style-src 'self'; object-src 'none'"
}

variable "public_access_control_max_age" {
  description = "Define access control max age for security headers policy"
  default     = "31536000"
}

variable "private_permissions_policy" {
  description = "Security headers permissions policies"
  default     = "accelerometer=(self), camera=(self), cross-origin-isolated=(self), encrypted-media=(self), geolocation=(self), microphone=(self), interest-cohort=()"
}

variable "private_access_control_allow_origins" {
  description = "Define access control origins"
  default     = "*.test.com"
}

variable "private_content_security_policy" {
  description = "Security headers content security policies"
  default     = "default-src 'none'; img-src 'self'; script-src 'self'; style-src 'self'; object-src 'none'"
}

variable "private_access_control_max_age" {
  description = "Define access control max age for security headers policy"
  default     = "31536000"
}

## AWS CodeCommit

variable "repository_name" {
  description = "Code commit repo name"
  default     = "codecommit-repo"
}

variable "repository_description" {
  description = "D escription code commit repo"
  default     = "Code Commit Git Repo"
}

variable "codecommit_user_name" {
  description = "Code commit user name"
  default     = "codecommit"
}

variable "iam_force_destroy" {
  description = "Enable code commit IAM user destroy"
  default     = "true"
}

variable "repo_default_branch" {
  description = "Code commit branch name"
  default     = "main"
}

## CodeBuild
variable "codebuild_bucket_name" {
  description = "Code build  artifact store s3 bucket name"
  default     = "codebuild1243"
}

variable "codebuild_bucket_versioning" {
  description = "Enable code build s3 bucket versioning"
  default     = "Enabled"
}

variable "codebuild_role_name" {
  description = "Code build IAM role name"
  default     = "codebuild-role"
}

variable "codebuild_project_name" {
  description = "Code build project name"
  default     = "code-build-project"
}

variable "codebuild_project_description" {
  description = "Code build project description"
  default     = "Code Build Project"
}

variable "build_timeout" {
  description = "Build time out"
  default     = "15" #min
}

variable "codebuild_image" {
  default     = "aws/codebuild/standard:6.0"
  description = "You can select (aws/codebuild/standard:6.0, aws/codebuild/standard:5.0, aws/codebuild/standard:4.0)"
}

variable "codebuild_compute_type" {
  default     = "BUILD_GENERAL1_SMALL"
  description = "You can select (BUILD_GENERAL1_SMALL, BUILD_GENERAL1_MEDIUM, BUILD_GENERAL1_LARGE, BUILD_GENERAL1_2XLARGE)"
}


## Code Deploy
variable "codedeploy_app_name" {
  description = "Code deploy application name"
  default     = "CodedDeploy-App"
}

variable "deployment_group_name" {
  description = "Code deploy deployment group name"
  default     = "Deployment-Group"
}

variable "codedeploy_service_role_name" {
  description = "Code deploy service role name"
  default     = "CodeDeploy-Serivce-Role"
}

variable "instances_terminate_time" {
  description = "EC2 instance terminate time after the deployment success"
  default     = "5"
}


## Code Pipeline
variable "pipeline_name" {
  description = "Pipeline name"
  default     = "CodePipeline"
}


## AWS WAF
variable "alb_waf_acl_name" {
  description = "Name of the Application load balancer waf acl"
  default     = "alb-waf-acl"
}

variable "cdn_waf_acl_name" {
  description = "Name of the ClodFront waf acl"
  default     = "cdn-waf-acl"
}

variable "alb_waf_acl_description" {
  description = "ALB WAF acl description"
  default     = "Application Load Balancer Waf ACL"
}

variable "cdn_waf_acl_description" {
  description = "CDN WAF acl description"
  default     = "CloudFront Waf ACL"
}


## Staic Webside
variable "static_bucket_name" {
  description = "S3 bucket name for static webside deployment"
  default     = "static-bucket-terraform-1"
}

variable "static_bucket_versioning" {
  default     = "Enabled"
  description = "Bucket versioning Enabled/Disabled"
}

variable "static_headers_policy_name" {
  description = "Cloudfront security headers policy name"
  default     = "Static-CDN-HeadersPolicy"
}

variable "static_cloudfront_description" {
  description = "Description for CloudFront distribution"
  default     = "Static CloudFront Distribution"
}

variable "static_permissions_policy" {
  description = "Security headers permissions policies"
  default     = "accelerometer=(self), camera=(self), cross-origin-isolated=(self), encrypted-media=(self), geolocation=(self), microphone=(self), interest-cohort=()"
}

variable "static_access_control_allow_origins" {
  description = "Define access control origins"
  default     = "*.test.com"
}

variable "static_content_security_policy" {
  description = "Security headers content security policies"
  default     = "default-src 'none'; img-src 'self'; script-src 'self'; style-src 'self'; object-src 'none'"
}

variable "static_access_control_max_age" {
  description = "Define access control max age for security headers policy"
  default     = "31536000"
}

variable "default_root_object" {
  description = "Object that you want CloudFront to return when an end user requests the root URL"
  default     = "index.html"
}
