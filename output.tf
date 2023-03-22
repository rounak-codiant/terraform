output "repo_name" {
  value = module.codecommit.codecommit_repo_name
}

output "repo_https_url" {
  value = module.codecommit.repo_https_url
}

output "repo_user_name" {
  value = module.codecommit.repo_user_name
}

output "repo_password" {
  value = nonsensitive(module.codecommit.repo_password)
}

