resource "aws_elasticache_cluster" "cachecluster" {
  cluster_id           = "cluster-example"
  engine               = var.cachedb_engine
  node_type            = var.cachedb_node_type
  num_cache_nodes      = var.num_cache_nodes
#   port                 = 11211
  az_mode              = var.cachedb_az_mode 
  snapshot_retention_limit = var.cachedb_snapshot_retention_limit
}


