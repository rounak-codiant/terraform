variable "project_name" {}

variable "env_suffix" {}

variable "cachedb_name" {}

variable "cachedb_description" {}

variable "version_upgrade" {}

variable "cachedb_engine" {}

variable "cachedb_node_type" {}

variable "cachedb_port" {}

variable "cachedb_snapshot_retention_limit" {}

variable "redis_vpc_id" {}

variable "redis_subnets" {}

variable "redis_user_name" {}

variable "redis_user_pwd" {
  type = string
}

# variable "application_sg_id" {}