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
| [aws_iam_user_policy_attachment.policy-attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_codecommit_user_name"></a> [codecommit\_user\_name](#input\_codecommit\_user\_name) | n/a | `any` | n/a | yes |
| <a name="input_env_suffix"></a> [env\_suffix](#input\_env\_suffix) | n/a | `any` | n/a | yes |
| <a name="input_iam_force_destroy"></a> [iam\_force\_destroy](#input\_iam\_force\_destroy) | n/a | `any` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | n/a | `any` | n/a | yes |
| <a name="input_repo_default_branch"></a> [repo\_default\_branch](#input\_repo\_default\_branch) | n/a | `any` | n/a | yes |
| <a name="input_repository_description"></a> [repository\_description](#input\_repository\_description) | n/a | `any` | n/a | yes |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_codecommit_repo_name"></a> [codecommit\_repo\_name](#output\_codecommit\_repo\_name) | Output the repo info back to main.tf |
| <a name="output_repo_arn"></a> [repo\_arn](#output\_repo\_arn) | n/a |
| <a name="output_repo_branch"></a> [repo\_branch](#output\_repo\_branch) | n/a |
| <a name="output_repo_https_url"></a> [repo\_https\_url](#output\_repo\_https\_url) | n/a |
| <a name="output_repo_password"></a> [repo\_password](#output\_repo\_password) | n/a |
| <a name="output_repo_user_name"></a> [repo\_user\_name](#output\_repo\_user\_name) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
