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

variable "tg_target_type" {}

# Register Instance to Target Group
variable "lb_target_id" {}

# Health Check
variable "lb_tg_health_check_path" {}

variable "lb_tg_health_check_port" {}

variable "lb_tg_health_check_protocol" {}

variable "lb_tg_health_check_matcher" {}


# Load Balancer
variable "lb_name" {}

variable "lb_internal" {}

variable "lb_type" {}

variable "lb_deletion_protection" {}

variable "alb_bucket_name" {}

# Load Balancer Listener
variable "lb_listener_protocol" {}

variable "lb_listener_port" {}

variable "alb_vpc_id" {}

variable "lb_subnets" {}

variable "alb_log_prefix" {}

variable "alb_bucket_versioning" {}

variable "alb_logs_bucket_name" {}

variable "alb_logs_enable" {}

variable "alb_idle_timeout" {}
