# SecretManagement

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret.secretmanager](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.secret_value](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [random_id.id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env_suffix"></a> [env\_suffix](#input\_env\_suffix) | n/a | `any` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | n/a | `any` | n/a | yes |
| <a name="input_secretmanager_name"></a> [secretmanager\_name](#input\_secretmanager\_name) | n/a | `any` | n/a | yes |
| <a name="input_sm_aws_region"></a> [sm\_aws\_region](#input\_sm\_aws\_region) | n/a | `any` | n/a | yes |
| <a name="input_sm_bucket_name"></a> [sm\_bucket\_name](#input\_sm\_bucket\_name) | n/a | `any` | n/a | yes |
| <a name="input_sm_db_connection"></a> [sm\_db\_connection](#input\_sm\_db\_connection) | Database Keys | `any` | n/a | yes |
| <a name="input_sm_db_host"></a> [sm\_db\_host](#input\_sm\_db\_host) | n/a | `any` | n/a | yes |
| <a name="input_sm_db_name"></a> [sm\_db\_name](#input\_sm\_db\_name) | n/a | `any` | n/a | yes |
| <a name="input_sm_db_password"></a> [sm\_db\_password](#input\_sm\_db\_password) | n/a | `any` | n/a | yes |
| <a name="input_sm_db_port"></a> [sm\_db\_port](#input\_sm\_db\_port) | n/a | `any` | n/a | yes |
| <a name="input_sm_db_read_host"></a> [sm\_db\_read\_host](#input\_sm\_db\_read\_host) | n/a | `any` | n/a | yes |
| <a name="input_sm_db_user"></a> [sm\_db\_user](#input\_sm\_db\_user) | n/a | `any` | n/a | yes |
| <a name="input_sm_mail_driver"></a> [sm\_mail\_driver](#input\_sm\_mail\_driver) | SMTP Keys | `any` | n/a | yes |
| <a name="input_sm_mail_encryption"></a> [sm\_mail\_encryption](#input\_sm\_mail\_encryption) | n/a | `any` | n/a | yes |
| <a name="input_sm_mail_from_address"></a> [sm\_mail\_from\_address](#input\_sm\_mail\_from\_address) | n/a | `any` | n/a | yes |
| <a name="input_sm_mail_from_name"></a> [sm\_mail\_from\_name](#input\_sm\_mail\_from\_name) | n/a | `any` | n/a | yes |
| <a name="input_sm_mail_host"></a> [sm\_mail\_host](#input\_sm\_mail\_host) | n/a | `any` | n/a | yes |
| <a name="input_sm_mail_password"></a> [sm\_mail\_password](#input\_sm\_mail\_password) | n/a | `any` | n/a | yes |
| <a name="input_sm_mail_port"></a> [sm\_mail\_port](#input\_sm\_mail\_port) | n/a | `any` | n/a | yes |
| <a name="input_sm_mail_user"></a> [sm\_mail\_user](#input\_sm\_mail\_user) | n/a | `any` | n/a | yes |
| <a name="input_sm_private_bucket"></a> [sm\_private\_bucket](#input\_sm\_private\_bucket) | n/a | `any` | n/a | yes |
| <a name="input_sm_public_bucket"></a> [sm\_public\_bucket](#input\_sm\_public\_bucket) | AWS Keys | `any` | n/a | yes |
| <a name="input_sm_redis_host"></a> [sm\_redis\_host](#input\_sm\_redis\_host) | Redis DB Keys | `any` | n/a | yes |
| <a name="input_sm_redis_password"></a> [sm\_redis\_password](#input\_sm\_redis\_password) | n/a | `any` | n/a | yes |
| <a name="input_sm_redis_port"></a> [sm\_redis\_port](#input\_sm\_redis\_port) | n/a | `any` | n/a | yes |
| <a name="input_sm_redis_user"></a> [sm\_redis\_user](#input\_sm\_redis\_user) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_secret_manager_arn"></a> [secret\_manager\_arn](#output\_secret\_manager\_arn) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
