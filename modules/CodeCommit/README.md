# CodeCommit

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_codecommit_repository.repo](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codecommit_repository) | resource |
| [aws_iam_service_specific_credential.codecommit_cred](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_service_specific_credential) | resource |
| [aws_iam_user.codecommit](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy_attachment.policy_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_codecommit_user_name"></a> [codecommit\_user\_name](#input\_codecommit\_user\_name) | Code commit user name | `any` | n/a | yes |
| <a name="input_env_suffix"></a> [env\_suffix](#input\_env\_suffix) | Define project environment | `any` | n/a | yes |
| <a name="input_iam_force_destroy"></a> [iam\_force\_destroy](#input\_iam\_force\_destroy) | Code commit IAM user destroy option | `any` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Define project name | `any` | n/a | yes |
| <a name="input_repo_default_branch"></a> [repo\_default\_branch](#input\_repo\_default\_branch) | Code commit branch name | `any` | n/a | yes |
| <a name="input_repository_description"></a> [repository\_description](#input\_repository\_description) | Code commit repo description | `any` | n/a | yes |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | Code commit repo name | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_codecommit_repo_name"></a> [codecommit\_repo\_name](#output\_codecommit\_repo\_name) | Code commit repo name |
| <a name="output_repo_arn"></a> [repo\_arn](#output\_repo\_arn) | Code commit repo ARN |
| <a name="output_repo_branch"></a> [repo\_branch](#output\_repo\_branch) | Code commit repo branch name |
| <a name="output_repo_https_url"></a> [repo\_https\_url](#output\_repo\_https\_url) | Code commit repo url |
| <a name="output_repo_password"></a> [repo\_password](#output\_repo\_password) | Code commit repo clone password |
| <a name="output_repo_user_name"></a> [repo\_user\_name](#output\_repo\_user\_name) | Code commit repo clone user name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
