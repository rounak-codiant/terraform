variable "project_name" {
  description = "Define project name"
}

variable "env_suffix" {
  description = "Define project environment"
}

variable "secretmanager_name" {
  description = "Define secret manager name"
}

#  Database Keys
variable "sm_db_connection" {
  description = "Database connection name"
}

variable "sm_db_read_host" {
  description = "Database reader endpoint"
}

variable "sm_db_host" {
  description = "Database writer endpoint"
}

variable "sm_db_port" {
  description = "Database port"
}

variable "sm_db_name" {
  description = "Database name"
}

variable "sm_db_user" {
  description = "Database user name"
}

variable "sm_db_password" {
  description = "Database password"
}

# SMTP Keys
variable "sm_mail_driver" {
  description = "Mail driver"
}

variable "sm_mail_host" {
  description = "Mail server host"
}

variable "sm_mail_port" {
  description = "Mail server port"
}

variable "sm_mail_user" {
  description = "Mail server user name"
}

variable "sm_mail_password" {
  description = "Mail server password"
}

variable "sm_mail_encryption" {
  description = "Mail server encryption option"
}

variable "sm_mail_from_address" {
  description = "Mail address to send mail from"
}

variable "sm_mail_from_name" {
  description = "Mail name to send mail from"
}

#  AWS Keys
variable "sm_public_bucket" {
  description = "Name of the public bucket"
}
variable "sm_private_bucket" {
  description = "Name of the private bucket"
}
variable "sm_aws_region" {
  description = "Name of the aws region"
}
variable "sm_bucket_name" {
  description = "Name of the public/primary bucket"
}


# Redis DB Keys
variable "sm_redis_host" {
  description = "Redis server host"
}

variable "sm_redis_port" {
  description = "Redis server port"
}

variable "sm_redis_user" {
  description = "Redis server user name"
}

variable "sm_redis_password" {
  description = "Redis server password"
}
