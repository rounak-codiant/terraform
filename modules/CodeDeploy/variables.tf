variable "project_name" {
  description = "Define project name"
}

variable "env_suffix" {
  description = "Define project environment"
}

variable "codedeploy_app_name" {
  description = "Code deploy application name"
}

variable "deployment_group_name" {
  description = "Code deploy deployment group name"
}

variable "codedeploy_service_role_name" {
  description = "Code deploy service role name"
}

variable "target_group_name" {
  description = "Name of the load balancer target group"
}

variable "instances_terminate_time" {
  description = "Default EC2 instance terminate time"
}
