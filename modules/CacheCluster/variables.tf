variable "project_name" {
  description = "Define project name"
}

variable "env_suffix" {
  description = "Define project environment"
}

variable "cachedb_name" {
  description = "Redis cluster name"
}

variable "cachedb_description" {
  description = "Redis cluster description"
}

variable "version_upgrade" {
  description = "Redis cluster version upgrade option"
}

variable "cachedb_engine" {
  description = "Cache database engine"
}

variable "cachedb_node_type" {
  description = "Cluster instance/node type"
}

variable "cachedb_port" {
  description = "Redis server port"
}

variable "redis_vpc_id" {
  description = "VPC id"
}

variable "redis_subnets" {
  description = "Public subnets for subnet group"
}

variable "redis_user_name" {
  description = "Redis username"
}

variable "redis_user_pwd" {
  type        = string
  description = "Redis password"
}

variable "snapshot_retention_limit" {
  description = "Number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them"
}

variable "rest_encryption_enabled" {
  description = "Rest encryption option for cluster"
}

variable "transit_encryption_enabled" {
  description = "transit encryption option for cluster"
}

variable "automatic_failover_enabled" {
  description = "Read-only replica will be automatically promoted to read/write primary if the existing primary fails"
}
