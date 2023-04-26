output "database_cluster_engine" {
  description = "Database engine"
  value       = aws_rds_cluster.database_cluster.engine
}

output "database_cluster_host" {
  description = "The DNS address of the RDS instance"
  value       = aws_rds_cluster.database_cluster.endpoint
}

output "database_cluster_port" {
  description = "The database port"
  value       = aws_rds_cluster.database_cluster.port
}

output "database_cluster_user" {
  description = "The master username for the database"
  value       = aws_rds_cluster.database_cluster.master_username
}

output "database_cluster_password" {
  description = "The master password for the database"
  value       = aws_rds_cluster.database_cluster.master_password
}

output "database_cluster_database_name" {
  description = "Database name"
  value       = aws_rds_cluster.database_cluster.database_name
}

output "database_security_group" {
  description = "Database security group id"
  value       = aws_security_group.database_sg.id
}
