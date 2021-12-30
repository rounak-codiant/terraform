resource "aws_rds_cluster" "database_cluster" {
  cluster_identifier      = var.database_cluster_identifier
  engine                  = var.database_engine
  # engine_mode             = var.database_cluster_engine_mode
  # engine_version          = 
  # availability_zones      = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name           = var.database_name
  master_username         = var.database_master_username
  master_password         = var.database_master_password
  backup_retention_period = var.database_backup_retention_period
  deletion_protection     = var.deletion_protection
  storage_encrypted       = var.storage_encrypted
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  allow_major_version_upgrade = var.allow_major_version_upgrade
  copy_tags_to_snapshot   = var.copy_tags_to_snapshot
}


resource "aws_rds_cluster_instance" "database_instance" {
  # count                   = "${local.enabled ? var.cluster_size : 0}"
  # identifier              = "${module.label.id}-${count.index+1}"
  cluster_identifier      = "${aws_rds_cluster.database_cluster.cluster_identifier}"
  engine                  = var.database_engine
  instance_class          = var.database_instance_class
  # db_subnet_group_name    = var.db_subnet_group_name
  publicly_accessible     = var.publicly_accessible
  # deletion_protection     = var.deletion_protection
  # storage_encrypted       = var.storage_encrypted
  copy_tags_to_snapshot   = var.copy_tags_to_snapshot
  # tags                    = "${module.label.tags}"
  # monitoring_interval     = "${var.rds_monitoring_interval}"
  # monitoring_role_arn     = "${var.rds_monitoring_role_arn}"

    depends_on = [ aws_rds_cluster.database_cluster ]
}