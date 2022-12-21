variable "public_cidr_block" {
  type        = list(string)
  description = "Public subnet CIDR blocks"
}

variable "private_cidr_block" {
  type        = list(string)
  description = "Private subnet CIDR blocks"
}

variable "enable_dns_hostnames" {
  description = "DNS hostnames in the VPC"
}

variable "vpc_cidr_block" {
  description = "Main VPC CIDR Block"
}

variable "project_name" {
  default = "TerraformProject"
}

variable "env_suffix" {
  default = "test"
}
