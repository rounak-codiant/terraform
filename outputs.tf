output "repo_name" {
  description = "Code commit repo name"
  value       = module.codecommit.codecommit_repo_name
}

output "repo_https_url" {
  description = "Code commit repo clone url"
  value       = module.codecommit.repo_https_url
}

output "repo_user_name" {
  description = "Code commit repo clone username"
  value       = module.codecommit.repo_user_name
}

output "repo_password" {
  description = "Code commit repo clone password"
  value       = nonsensitive(module.codecommit.repo_password)
}
