# output "cache_cluster_engine" {
#     value = aws_elasticache_cluster.cachecluster.engine
# }

# output "cache_cluster_host" {
#     value = aws_elasticache_cluster.cachecluster.address
# }

# output "endpoint" {
#   value = "${join(":", list(aws_elasticache_cluster.cachecluster.cache_nodes.0.address))}"
# }

# output "endpoint" {
#   value       = var.cluster_enabled ? "" : (var.cluster_replication_enabled ? join("", aws_elasticache_replication_group.cluster.*.configuration_endpoint_address) : join("", aws_elasticache_replication_group.default.*.primary_endpoint_address))
#   description = "Redis primary or configuration endpoint, whichever is appropriate for the given cluster mode"
# }

# output "cache_cluster_port" {
#     value = aws_elasticache_cluster.cachecluster.port
# }

# output "cache_cluster_user" {
#     value = aws_elasticache_cluster.cachecluster.engine
# }

# output "cache_cluster_password" {
#     value = aws_elasticache_cluster.cachecluster.engine
# }

##########################################################################

output "cache_cluster_host" {
  value = aws_elasticache_replication_group.redis.primary_endpoint_address
}

output "cache_cluster_port" {
  value = aws_elasticache_replication_group.redis.port
}
