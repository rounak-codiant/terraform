variable "pipeline_name" {
  description = "Pipeline name"
}

variable "artifact_store_bucket" {
  description = "Pipeline artifact store s3 bucket name"
}

variable "codebuild_project_name" {
  description = "Code build project name"
}

variable "codedeploy_app_name" {
  description = "Code deploy application name"
}

variable "codedeployment_group_name" {
  description = "Code deployment group name"
}

variable "bucket_arn" {
  description = "Pipeline artifact store s3 bucket ARN"
}

variable "repository_name" {
  description = "Code commit repo name"
}

variable "branch_name" {
  description = "Code commit repo branch name"
}
