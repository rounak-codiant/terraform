resource "aws_security_group" "database_sg" {
  name        = "Database-SG"
  description = "Database - Security Group"
  vpc_id      = var.database_vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.database_application_sg]
    description     = "RDS Traffic"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags_all = {
    Name        = "${var.project_name}-Database-SG"
    Environment = "${var.env_suffix}"
  }
}

resource "aws_db_subnet_group" "subnet_group" {
  name       = "db-subnet-group"
  subnet_ids = var.database_subnet_ids

  tags_all = {
    Name        = "${var.project_name}-Database-Subnet-Group"
    Environment = "${var.env_suffix}"
  }
}

resource "aws_rds_cluster" "database_cluster" {
  cluster_identifier = var.database_cluster_identifier
  engine             = var.database_engine
  # engine_mode             = var.database_cluster_engine_mode
  engine_version = var.database_cluster_engine_version
  # availability_zones      = var.db_availability_zones
  database_name               = var.database_name
  master_username             = var.database_master_username
  master_password             = var.database_master_password
  backup_retention_period     = var.database_backup_retention_period
  deletion_protection         = var.deletion_protection
  storage_encrypted           = var.storage_encrypted
  vpc_security_group_ids      = ["${aws_security_group.database_sg.id}"]
  allow_major_version_upgrade = var.allow_major_version_upgrade
  copy_tags_to_snapshot       = var.copy_tags_to_snapshot
  skip_final_snapshot         = var.database_cluster_skip_final_snapshot
  final_snapshot_identifier   = "backup-cluster"

  tags_all = {
    Name        = "${var.project_name}"
    Environment = "${var.env_suffix}"
  }
  depends_on = [aws_security_group.database_sg]
}


resource "aws_rds_cluster_instance" "database_instance" {
  # count                   = "${local.enabled ? var.cluster_size : 0}"
  identifier            = var.database_instance_identifier
  cluster_identifier    = aws_rds_cluster.database_cluster.id
  engine                = aws_rds_cluster.database_cluster.engine
  engine_version        = aws_rds_cluster.database_cluster.engine_version
  instance_class        = var.database_instance_class
  db_subnet_group_name  = aws_db_subnet_group.subnet_group.id
  publicly_accessible   = var.publicly_accessible
  copy_tags_to_snapshot = var.copy_tags_to_snapshot
  # monitoring_interval     = "${var.rds_monitoring_interval}"
  # monitoring_role_arn     = "${var.rds_monitoring_role_arn}"

  tags_all = {
    Name        = "${var.project_name}-idb-instance"
    Environment = "${var.env_suffix}"
  }
  depends_on = [aws_rds_cluster.database_cluster]
}