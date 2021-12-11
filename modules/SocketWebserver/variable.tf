variable "project_name" {
  default = "TerraformProject"
}

variable "env_suffix" {
  default = "dev"
}

variable "instance_type" {
  # default = "t2.micro"
}
variable "key_pair_location" {
  # default = "~/.ssh/id_rsa.pub"
}
variable "ebs_volume_type" {
  # default = "gp2"
}
variable "ebs_volume_size" {
  # default = "30"
}
# variable "ec2_ssh_ip" {
#   # default = "0.0.0.0/0"
# }
