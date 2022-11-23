variable "project_name" {}

variable "env_suffix" {}

variable "database_vpc_id" {}

variable "database_subnet_ids" {}

variable "database_cluster_identifier" {}

variable "database_engine" {}

# variable "database_cluster_engine_mode" {}

variable "database_name" {}

variable "database_cluster_engine_version" {}

variable "database_master_username" {
  sensitive = true
}

variable "database_master_password" {
  sensitive = true
}

variable "database_backup_retention_period" {}

variable "deletion_protection" {}

variable "storage_encrypted" {}

variable "database_application_sg" {}

variable "allow_major_version_upgrade" {}

variable "copy_tags_to_snapshot" {}

variable "database_cluster_skip_final_snapshot" {}


############# Database Instance #############

# variable "allocated_storage" {}

variable "database_instance_class" {}

variable "publicly_accessible" {}

variable "database_instance_identifier" {}
