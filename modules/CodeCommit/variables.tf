variable "project_name" {
  description = "Define project name"
}

variable "env_suffix" {
  description = "Define project environment"
}

variable "repository_name" {
  description = "Code commit repo name"
}

variable "repository_description" {
  description = "Code commit repo description"
}

variable "codecommit_user_name" {
  description = "Code commit user name"
}

variable "iam_force_destroy" {
  description = "Code commit IAM user destroy option"
}

variable "repo_default_branch" {
  description = "Code commit branc name"
}
