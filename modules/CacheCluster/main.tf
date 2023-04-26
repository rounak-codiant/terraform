
# Crete Security Group For Redis
#tfsec:ignore:aws-ec2-no-public-egress-sgr
#tfsec:ignore:aws-ec2-no-public-ingress-sgr
resource "aws_security_group" "redis_sg" {
  name        = "Redis-SG"
  description = "Redis - Security Group"
  vpc_id      = var.redis_vpc_id

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Redis Traffic"
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
    Name        = "${var.project_name}-Redis-SG"
    Environment = "${var.env_suffix}"
  }
}

# Create Redis Subnet Group
resource "aws_elasticache_subnet_group" "subnet_group" {
  name        = "Redis-Subnet-Group"
  subnet_ids  = var.redis_subnets
  description = "Elasticache Private Subnets Group"

  tags = {
    Name        = "${var.project_name}-Redis"
    Environment = "${var.env_suffix}"
  }
}

# Create Redis User
resource "aws_elasticache_user" "redis_user" {
  user_id       = var.redis_user_name
  user_name     = "default"
  access_string = "on ~* +@all"
  engine        = "REDIS"
  passwords     = [var.redis_user_pwd]
}

# Create Redis User Group
resource "aws_elasticache_user_group" "redis_user_group" {
  engine        = "REDIS"
  user_group_id = "Redis-Group"
  user_ids      = [aws_elasticache_user.redis_user.user_id]
}

# Redis Cluster Mode Enabled
resource "aws_elasticache_replication_group" "redis" {
  replication_group_id       = var.cachedb_name
  description                = var.cachedb_description
  auto_minor_version_upgrade = var.version_upgrade
  engine                     = var.cachedb_engine
  node_type                  = var.cachedb_node_type
  port                       = var.cachedb_port
  apply_immediately          = true
  at_rest_encryption_enabled = var.rest_encryption_enabled
  transit_encryption_enabled = var.transit_encryption_enabled
  automatic_failover_enabled = var.automatic_failover_enabled
  user_group_ids             = [aws_elasticache_user_group.redis_user_group.id]
  subnet_group_name          = aws_elasticache_subnet_group.subnet_group.name
  security_group_ids         = ["${aws_security_group.redis_sg.id}"]
  snapshot_retention_limit   = var.snapshot_retention_limit

  tags = {
    Name        = "${var.project_name}-Redis"
    Environment = "${var.env_suffix}"
  }
  depends_on = [
    aws_elasticache_user_group.redis_user_group,
    aws_elasticache_subnet_group.subnet_group
  ]
}
