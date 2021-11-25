# module aws_modules {
#   source  = "./modules/ec2.tf"
# }

locals {
  local_naming = "${var.project_name}-${var.env_suffix}"
}


module "application_server" {
  source = "./modules/ApplicationWebserver"
  instance_type = var.instance_type
  # tags = {
  #   Name = var.local_naming
  # }

}