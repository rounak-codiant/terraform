resource "aws_security_group" "database_sg" {
  name        = "Database-SG"
  description = "Database - Security Group"
  vpc_id      = var.database_vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "RDS Traffic"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "Allow all Traffic"
  }

  tags_all = {
    Name        = "${var.project_name}-Database-SG"
    Environment = "${var.env_suffix}"
  }
}

resource "aws_db_subnet_group" "subnet_group" {
  name        = "db-subnet-group"
  subnet_ids  = var.database_subnet_ids
  description = "RDS DB Private Subnets Group"

  tags_all = {
    Name        = "${var.project_name}-Database-Subnet-Group"
    Environment = "${var.env_suffix}"
  }
}

resource "aws_rds_cluster_parameter_group" "cluster_pg" {
  name        = var.cluster_parameter_group
  family      = var.cluster_parameter_group_family
  description = "RDS cluster Custom Parameter Group"

  parameter {
    name  = "general_log"
    value = var.general_log
  }

  parameter {
    name  = "slow_query_log"
    value = var.slow_query_log
  }

  parameter {
    name  = "long_query_time"
    value = var.long_query_time
  }

  parameter {
    name  = "max_allowed_packet"
    value = var.max_allowed_packet
  }

  tags_all = {
    Name        = "${var.project_name}-Cluster-Parameter-Group"
    Environment = "${var.env_suffix}"
  }
}

resource "aws_db_parameter_group" "db_instance_pg" {
  name        = var.db_instance_pg_name
  family      = var.db_parameter_group_family
  description = "RDS instance Custom Parameter Group"

  parameter {
    name  = "general_log"
    value = var.general_log
  }

  parameter {
    name  = "slow_query_log"
    value = var.slow_query_log
  }

  parameter {
    name  = "long_query_time"
    value = var.long_query_time
  }

  parameter {
    name  = "max_allowed_packet"
    value = var.max_allowed_packet
  }
  tags_all = {
    Name        = "${var.project_name}-Instance-Parameter-Group"
    Environment = "${var.env_suffix}"
  }
}


resource "aws_rds_cluster" "database_cluster" {
  cluster_identifier = var.database_cluster_identifier
  engine             = var.database_engine
  # engine_mode                   = var.database_cluster_engine_mode
  engine_version                  = var.database_cluster_engine_version
  apply_immediately               = true
  database_name                   = var.database_name
  db_subnet_group_name            = aws_db_subnet_group.subnet_group.name
  master_username                 = var.database_master_username
  master_password                 = var.database_master_password
  backup_retention_period         = var.database_backup_retention_period
  deletion_protection             = var.deletion_protection
  storage_encrypted               = var.storage_encrypted
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.cluster_pg.name
  vpc_security_group_ids          = ["${aws_security_group.database_sg.id}"]
  allow_major_version_upgrade     = var.allow_major_version_upgrade
  copy_tags_to_snapshot           = var.copy_tags_to_snapshot
  skip_final_snapshot             = var.database_cluster_skip_final_snapshot
  final_snapshot_identifier       = var.snapshot_identifier_name
  enabled_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery"]

  tags = {
    Name        = "${var.project_name}-db-cluster"
    Environment = "${var.env_suffix}"
  }
  depends_on = [aws_security_group.database_sg]
}


resource "aws_rds_cluster_instance" "database_instance" {
  identifier              = var.database_instance_identifier
  cluster_identifier      = aws_rds_cluster.database_cluster.id
  engine                  = aws_rds_cluster.database_cluster.engine
  apply_immediately       = true
  engine_version          = aws_rds_cluster.database_cluster.engine_version
  instance_class          = var.database_instance_class
  db_subnet_group_name    = aws_db_subnet_group.subnet_group.name
  publicly_accessible     = var.publicly_accessible
  copy_tags_to_snapshot   = var.copy_tags_to_snapshot
  db_parameter_group_name = aws_db_parameter_group.db_instance_pg.name
  # monitoring_interval     = "60"

  tags = {
    Name        = "${var.project_name}-db-instance"
    Environment = "${var.env_suffix}"
  }
  depends_on = [aws_rds_cluster.database_cluster]
}
