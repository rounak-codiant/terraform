variable "project_name" {
  description = "Define project name"
}

variable "env_suffix" {
  description = "Define project environment"
}

variable "database_vpc_id" {
  description = "VPC ID for database"
}

variable "database_subnet_ids" {
  description = "Private subnets id for database subnet group"
}

variable "database_cluster_identifier" {
  description = "Database cluster name"
}

variable "database_engine" {
  description = "Database engine"
}

# variable "database_cluster_engine_mode" {}

variable "database_name" {
  description = "Database name"
}

variable "database_cluster_engine_version" {
  description = "Database cluster engine"
}

variable "database_master_username" {
  description = "Database master username"
  sensitive   = true
}

variable "database_master_password" {
  description = "Database master password"
  sensitive   = true
}

variable "database_backup_retention_period" {
  description = "Database backup retention time"
}

variable "deletion_protection" {
  description = "Database delete protection option"
}

variable "storage_encrypted" {
  description = "Database stotage encryption option"
}

variable "allow_major_version_upgrade" {
  description = "Database version upgrade option"
}

variable "copy_tags_to_snapshot" {
  description = "Databse snapshot tag option"
}

variable "database_cluster_skip_final_snapshot" {
  description = "Databse cluster final snapshot option"
}

variable "snapshot_identifier_name" {
  description = "Database snapshot name"
}

############# Database Instance #############

variable "database_instance_class" {
  description = "Database instance type"
}

variable "publicly_accessible" {
  description = "Databse pulic access option"
}

variable "database_instance_identifier" {
  description = "Database instance name"
}

variable "cluster_parameter_group" {
  description = "Database cluster parameter group name"
}

variable "db_instance_pg_name" {
  description = "Database instance parameter group name"
}

variable "long_query_time" {
  description = "Database long query maximum run time"
}

variable "max_allowed_packet" {
  description = "Maximum allowed packet"
}

variable "general_log" {
  description = "Database general log option"
}

variable "slow_query_log" {
  description = "Database slow log option"
}

variable "db_parameter_group_family" {
  description = "Database instance parameter group family"
}

variable "cluster_parameter_group_family" {
  description = "Database cluster parameter group family"
}
