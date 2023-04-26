variable "project_name" {
  description = "Define project name"
}

variable "env_suffix" {
  description = "Define project environment"
}

variable "codebuild_bucket_name" {
  description = "Code build  artifact store s3 bucket name"
}

variable "codebuild_bucket_versioning" {
  description = "Code build s3 bucket versioning option"
}

variable "codebuild_role_name" {
  description = "Code build IAM role name"
}

variable "codebuild_project_name" {
  description = "Code build project name"
}

variable "codebuild_project_description" {
  description = "Code build project description"
}

variable "build_timeout" {
  description = "Default code build time out"
}

variable "codebuild_image" {
  description = "Default code buiuld image"
}

variable "repo_name" {
  description = "Code commit repo name to take code clone"
}

variable "codebuild_source_branch" {
  description = "Code commit repo branch to take clone from"
}

variable "codecommit_arn" {
  description = "Code commit repo ARN"
}

variable "codebuild_compute_type" {
  description = "Code build compute instance type"
}
