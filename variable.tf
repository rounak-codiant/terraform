# AWS Provider Key
variable aws_access_key {}

variable aws_secret_key {}

variable aws_region {
  default = "us-east-2"
}

#Project and variable
variable "project_name" {
  default = "TerraformProject"
}

variable "env_suffix" {
  default = "dev"
}
#EC2
variable "instance_type" {
  default = "t2.micro"
}

variable "ebs_volume_type" {
  default = "gp2"
}
variable "ebs_volume_size" {
  default = "30"
}
variable "key_pair_location" {
  default = "~/.ssh/id_rsa.pub"
}

#S3 Private Bucket
variable "private_bucket_name" {
    default = "codiant-private-bucket-terraform-1"
}

variable "private_bucket_versioning" {
    # default = "false"
}