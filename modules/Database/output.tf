output "database_cluster_engine" {
  value = aws_rds_cluster.database_cluster.engine
}

output "database_cluster_host" {
  value = aws_rds_cluster.database_cluster.endpoint
}

output "database_cluster_port" {
  value = aws_rds_cluster.database_cluster.port
}

output "database_cluster_user" {
  value = aws_rds_cluster.database_cluster.master_username
}

output "database_cluster_password" {
  value = aws_rds_cluster.database_cluster.master_password
}

output "database_cluster_database_name" {
  value = aws_rds_cluster.database_cluster.database_name
}

output "database_security_group" {
  value = aws_security_group.database_sg.id
}
