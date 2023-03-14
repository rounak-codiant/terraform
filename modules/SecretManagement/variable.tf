variable "project_name" {}
variable "env_suffix" {}
variable "secretmanager_name" {}

#  Database Keys
variable "sm_db_connection" {}
variable "sm_db_read_host" {}
variable "sm_db_host" {}
variable "sm_db_port" {}
variable "sm_db_name" {}
variable "sm_db_user" {}
variable "sm_db_password" {}

# SMTP Keys
variable "sm_mail_driver" {}
variable "sm_mail_host" {}
variable "sm_mail_port" {}
variable "sm_mail_user" {}
variable "sm_mail_password" {}
variable "sm_mail_encryption" {}
variable "sm_mail_from_address" {}
variable "sm_mail_from_name" {}

#  AWS Keys
variable "sm_public_bucket" {}
variable "sm_private_bucket" {}
variable "sm_aws_region" {}
variable "sm_bucket_name" {}
variable "sm_access_id" {}
variable "sm_access_key" {}

# Redis DB Keys
variable "sm_redis_host" {}
variable "sm_redis_port" {}
variable "sm_redis_user" {}
variable "sm_redis_password" {}