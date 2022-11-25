
# Crete Security Group For Redis
resource "aws_security_group" "redis_sg" {
  name        = "Redis-SG"
  description = "Redis - Security Group"
  vpc_id      = var.redis_vpc_id

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    # security_groups = [var.application_sg_id]
    description = "Redis Traffic"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags_all = {
    Name        = "${var.project_name}-Redis-SG"
    Environment = "${var.env_suffix}"
  }
}

resource "aws_elasticache_security_group" "sg" {
  name                 = "redis-security-group"
  security_group_names = [aws_security_group.redis_sg.name]
  depends_on = [
    aws_security_group.redis_sg
  ]
}

# Create Redis Subnet Group
resource "aws_elasticache_subnet_group" "subnet_group" {
  name       = "redis-subnet_group"
  subnet_ids = var.redis_subnets
}

# Create Redis User
resource "aws_elasticache_user" "redis_user" {
  user_id       = var.redis_user_name
  user_name     = "default"
  access_string = "on ~* @all"
  engine        = "REDIS"
  passwords     = [var.redis_user_pwd]
}

# Create Redis User Group
resource "aws_elasticache_user_group" "redis_user_group" {
  engine        = "REDIS"
  user_group_id = "RedisGroup"
  user_ids      = [aws_elasticache_user.redis_user.user_id]
}

# Redis Cluster Mode Enabled
resource "aws_elasticache_replication_group" "redis" {
  replication_group_id          = var.cachedb_name
  replication_group_description = var.cachedb_description
  auto_minor_version_upgrade    = var.version_upgrade
  engine                        = var.cachedb_engine
  node_type                     = var.cachedb_node_type
  port                          = var.cachedb_port
  apply_immediately             = true
  at_rest_encryption_enabled    = true
  transit_encryption_enabled    = true
  automatic_failover_enabled    = false
  user_group_ids                = [aws_elasticache_user_group.redis_user_group.user_group_id]
  subnet_group_name             = aws_elasticache_subnet_group.subnet_group.name
  security_group_ids            = ["${aws_security_group.redis_sg.id}"]
  security_group_names          = ["${aws_security_group.redis_sg.name}"]

  tags = {
    Name        = "${var.project_name}-Redis"
    Environment = "${var.env_suffix}"
  }
  depends_on = [
    aws_elasticache_user_group.redis_user_group,
    aws_elasticache_subnet_group.subnet_group
  ]
}







# resource "aws_elasticache_cluster" "redis_cache" {
#   cluster_id               = "cluster-example"
#   engine                   = var.cachedb_engine
#   # engine_version           = var.cachedb_engine_version
#   node_type                = var.cachedb_node_type
#   num_cache_nodes          = var.num_cache_nodes
#   port                     = var.cachedb_port
#   snapshot_retention_limit = var.cachedb_snapshot_retention_limit
#   # az_mode              = var.cachedb_az_mode 
# }
##############################################################################
# resource "aws_elasticache_replication_group" "redis_cache" {
#   automatic_failover_enabled    = true
#   replication_group_id          = var.cachedb_name
#   replication_group_description = var.cachedb_description
#   node_type                     = var.cachedb_node_type
#   number_cache_clusters         = 2
#   port                          = var.cachedb_port
#   tags_all = {
#     Name        = "${var.project_name}"
#     Environment = "${var.env_suffix}"
#   }
# }

