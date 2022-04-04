# resource "aws_elasticache_cluster" "redis_cache" {
#   cluster_id               = "cluster-example"
#   engine                   = var.cachedb_engine
#   engine_version           = var.cachedb_engine_version
#   node_type                = var.cachedb_node_type
#   num_cache_nodes          = var.num_cache_nodes
#   port                     = var.cachedb_port
#   snapshot_retention_limit = var.cachedb_snapshot_retention_limit
#   # az_mode              = var.cachedb_az_mode 
# }


##############################################################################

resource "aws_elasticache_replication_group" "redis_cache" {
  automatic_failover_enabled    = true
  replication_group_id          = var.cachedb_name
  replication_group_description = var.cachedb_description
  node_type                     = var.cachedb_node_type
  number_cache_clusters         = 2
  port                          = var.cachedb_port

  tags_all = {
    Name        = "${var.project_name}"
    Environment = "${var.env_suffix}"
  }
}



