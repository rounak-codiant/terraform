
# Output the repo info back to main.tf
output "codecommit_repo_name" {
  description = "Code commit repo name"
  value       = aws_codecommit_repository.repo.repository_name
}

output "repo_https_url" {
  description = "Code commit repo url"
  value       = aws_codecommit_repository.repo.clone_url_http
}

output "repo_password" {
  description = "Code commit repo clone password"
  value       = aws_iam_service_specific_credential.codecommit_cred.service_password
}

output "repo_user_name" {
  description = "Code commit repo clone user name"
  value       = aws_iam_service_specific_credential.codecommit_cred.service_user_name
}

output "repo_branch" {
  description = "Code commit repo branch name"
  value       = aws_codecommit_repository.repo.default_branch
}

output "repo_arn" {
  description = "Code commit repo ARN"
  value       = aws_codecommit_repository.repo.arn
}
