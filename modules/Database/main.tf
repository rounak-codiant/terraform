resource "aws_rds_cluster" "database_cluster" {
  cluster_identifier      = var.database_cluster_identifier
  engine                  = var.database_engine
  # engine_version          = 
  # availability_zones      = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name           = var.database_name
  master_username         = var.database_master_username
  master_password         = var.database_master_password
  backup_retention_period = var.database_backup_retention_period
}