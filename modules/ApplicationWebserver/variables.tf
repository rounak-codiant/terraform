variable "project_name" {
  description = "Define project name"
}

variable "env_suffix" {
  description = "Define project environment"
}

variable "instance_type" {
  description = "Application server instance type"
}

variable "key_pair_name" {
  description = "Instance ssh pem file name"
}

variable "ebs_volume_type" {
  description = "EC2 EBS type"
}

variable "ebs_volume_size" {
  description = "EBS volume size"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "ec2_monitoring" {
  description = "Instance monitoring option"
}

variable "ec2_role_name" {
  description = "Instance IAM role name"
}

variable "ec2_policy_name" {
  description = "Instance IAM policy name"
}

variable "ec2_subnet_id" {
  description = "Instance public subnet id"
}

variable "php_version" {
  description = "Define PHP version to install it on server"
}

variable "node_version" {
  description = "Define Node version to install it on server"
}

variable "composer_install" {
  description = "Composer install on server or not"
}

variable "php_nginx_config" {
  description = "Nginx configuration for PHP"
}

variable "php_module" {
  description = "PHP module install or not"
}

variable "node_nginx_config" {
  description = "Nginx configuration for Node"
}

variable "ami_name" {
  description = "Name of the instance AMI"
}
