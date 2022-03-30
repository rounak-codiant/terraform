variable "project_name" {
  default = "TerraformProject"
}

variable "env_suffix" {
  default = "dev"
}

# Target Group
variable "tg_name" {}

variable "tg_port" {}

variable "tg_protocol" {}

variable "lb_vpc_id" {}

variable "tg_target_type" {}


# Health Check
variable "lb_tg_health_check_path" {}

variable "lb_tg_health_check_port" {}

variable "lb_tg_health_check_protocol" {}

variable "lb_tg_health_check_matcher" {}


# Load Balancer
variable "lb_name" {}

variable "lb_internal" {}

variable "lb_type" {}

variable "lb_security_groups" {}

variable "lb_subnets" {}

variable "lb_deletion_protection" {}


# Load Balancer Access Logs
variable "lb_access_logs" {}

variable "lb_access_logs_bucket" {}

variable "lb_access_logs_prefix" {}

# Load Balancer Listener
variable "lb_listener_protocol" {}

variable "lb_listener_port" {}
