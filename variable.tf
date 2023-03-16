# AWS Provider Key
variable "aws_access_key" {
  default = ""
}

variable "aws_secret_key" {
  default = ""
}

variable "aws_profile_name" {
  default = ""
}

variable "aws_region" {
  default = "us-east-1"
}

#Project and variable
variable "project_name" {
  default = "Terraform-Project"
}

variable "env_suffix" {
  default = "test"
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
  default = "t2.micro"
}

variable "ebs_volume_type" {
  default = "gp2"
}
variable "ebs_volume_size" {
  default     = "30"
  description = "Storage Capacity"
}

variable "key_pair_name" {
  default     = "pemkey"
  description = "Name of EC2 Key Pair"
}

variable "ec2_role_name" {
  default = "ec2-role"
}

variable "ec2_policy_name" {
  default = "ec2-role-policy"
}

variable "ec2_monitoring" {
  default = "true"
}

variable "php-version" {
  default     = "8.1"
  description = "PHP "
}

variable "node-version" {
  default = "16"
}

variable "composer-install" {
  default = "yes"
}

variable "php-nginx-config" {
  default = "yes"
}

variable "php-module" {
  default = "yes"
}

variable "nginx-nginx-config" {
  default = "no"
}

# #S3 Private Bucket
variable "private_bucket_name" {
  default = "codiant-private-bucket-terraform-1"
}

variable "private_bucket_versioning" {
  default = "true"
}

variable "private_bucket_acceleration" {
  default = "Suspended"
}

# #S3 Public Bucket
variable "public_bucket_name" {
  default = "codiant-public-bucket-terraform-1"
}

variable "public_bucket_versioning" {
  default = "true"
}

variable "public_bucket_acceleration" {
  default = "Suspended"
}

# #Database (RDS)
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

variable "allow_major_version_upgrade" {
  default = "false"
}

variable "copy_tags_to_snapshot" {
  default = "true"
}

variable "snapshot_identifier_name" {
  default = "db-snap"
}

# variable "allocated_storage" {
#   default = "10"
# }

variable "database_instance_class" {
  default = "db.t3.medium"
}

variable "publicly_accessible" {
  default = "false"
}


variable "cluster_parameter_group" {
  default = "cluster-parameter-group"
}

variable "db_instance_pg_name" {
  default = "db-instance-parameter-group"
}


variable "long_query_time" {
  default = "10" //10 second
}

variable "max_allowed_packet" {
  default = "64000000" //64MB
}


# # Elastic Cache (Redis)
variable "redis_user_name" {
  default = "redis"

}
variable "redis_user_pwd" {
  type    = string
  default = "dm3YbhsFqa1P121KEC"
}

variable "cachedb_engine" {
  default = "redis"
}
variable "cachedb_name" {
  default = "redis-cache"
}
variable "cachedb_description" {
  default = "Redis Database"
}

variable "cachedb_port" {
  default = "6379"
}

variable "cachedb_node_type" {
  default = "cache.t3.small"
}

variable "num_cache_nodes" {
  default = "1"
}

variable "cachedb_snapshot_retention_limit" {
  default = "3"
}

variable "version_upgrade" {
  default = "false"
}



# # Secret Manager
variable "secretmanager_name" {
  default = "secretmanager"
}

#ALB (Application Load Balancer)
#Target Group
variable "tg_name" {
  description = "value for the target group name"
  default     = "default-tg"
}

variable "tg_port" {
  description = "value for the target group port"
  default     = "80"
}

variable "tg_protocol" {
  description = "value for the target group protocol"
  default     = "HTTP"
}

variable "tg_target_type" {
  description = "value for the target group target type"
  default     = "instance"
}

# Health Check
variable "lb_tg_health_check_path" {
  description = "value for the target group health check path"
  default     = "/"
}

variable "lb_tg_health_check_port" {
  description = "value for the target group health check port"
  default     = "80"
}

variable "lb_tg_health_check_protocol" {
  description = "value for the target group health check protocol"
  default     = "HTTP"
}

variable "lb_tg_health_check_matcher" {
  description = "value for the target group health check matcher"
  default     = "200"
}


# Load Balancer
variable "lb_name" {
  description = "value for the load balancer name"
  default     = "alb-terraform-1"
}

variable "lb_internal" {
  description = "false value will create public load balancer (default) and true value will create internal load balancer"
  default     = "false"
}

variable "lb_type" {
  description = "valid values are 'application' or 'network' (default)"
  default     = "application"
}

variable "lb_deletion_protection" {
  description = "value for the load balancer deletion protection"
  default     = "true"
}



# Load Balancer Access Logs
variable "alb_bucket_name" {
  description = "S3 bucket name to store alb access logs"
  default     = "alb-bucket"
}

# Load Balancer Listener
variable "lb_listener_protocol" {
  description = "value for the load balancer listener protocol"
  default     = "HTTP"
}

variable "lb_listener_port" {
  description = "value for the load balancer listener port"
  default     = "80"
}


#CDN
variable "public_headers_policy_name" {
  default = "CustomHeadersPolicy"
}

variable "private_headers_policy_name" {
  default = "CustomHeadersPolicy"
}
