
# Output the repo info back to main.tf
output "codecommit_repo_name" {
  value = aws_codecommit_repository.repo.repository_name
}

output "repo_https_url" {
  value = aws_codecommit_repository.repo.clone_url_http
}

output "repo_password" {
  value = aws_iam_service_specific_credential.codecommit_cred.service_password
}

output "repo_user_name" {
  value = aws_iam_service_specific_credential.codecommit_cred.service_user_name
}

output "repo_branch" {
  value = aws_codecommit_repository.repo.default_branch
}

output "repo_arn" {
  value = aws_codecommit_repository.repo.arn
}