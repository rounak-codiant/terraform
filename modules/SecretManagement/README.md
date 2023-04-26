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
| <a name="input_env_suffix"></a> [env\_suffix](#input\_env\_suffix) | Define project environment | `any` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Define project name | `any` | n/a | yes |
| <a name="input_secretmanager_name"></a> [secretmanager\_name](#input\_secretmanager\_name) | Define secret manager name | `any` | n/a | yes |
| <a name="input_sm_aws_region"></a> [sm\_aws\_region](#input\_sm\_aws\_region) | Name of the aws region | `any` | n/a | yes |
| <a name="input_sm_bucket_name"></a> [sm\_bucket\_name](#input\_sm\_bucket\_name) | Name of the public/primary bucket | `any` | n/a | yes |
| <a name="input_sm_db_connection"></a> [sm\_db\_connection](#input\_sm\_db\_connection) | Database connection name | `any` | n/a | yes |
| <a name="input_sm_db_host"></a> [sm\_db\_host](#input\_sm\_db\_host) | Database writer endpoint | `any` | n/a | yes |
| <a name="input_sm_db_name"></a> [sm\_db\_name](#input\_sm\_db\_name) | Database name | `any` | n/a | yes |
| <a name="input_sm_db_password"></a> [sm\_db\_password](#input\_sm\_db\_password) | Database password | `any` | n/a | yes |
| <a name="input_sm_db_port"></a> [sm\_db\_port](#input\_sm\_db\_port) | Database port | `any` | n/a | yes |
| <a name="input_sm_db_read_host"></a> [sm\_db\_read\_host](#input\_sm\_db\_read\_host) | Database reader endpoint | `any` | n/a | yes |
| <a name="input_sm_db_user"></a> [sm\_db\_user](#input\_sm\_db\_user) | Database user name | `any` | n/a | yes |
| <a name="input_sm_mail_driver"></a> [sm\_mail\_driver](#input\_sm\_mail\_driver) | Mail driver | `any` | n/a | yes |
| <a name="input_sm_mail_encryption"></a> [sm\_mail\_encryption](#input\_sm\_mail\_encryption) | Mail server encryption option | `any` | n/a | yes |
| <a name="input_sm_mail_from_address"></a> [sm\_mail\_from\_address](#input\_sm\_mail\_from\_address) | Mail address to send mail from | `any` | n/a | yes |
| <a name="input_sm_mail_from_name"></a> [sm\_mail\_from\_name](#input\_sm\_mail\_from\_name) | Mail name to send mail from | `any` | n/a | yes |
| <a name="input_sm_mail_host"></a> [sm\_mail\_host](#input\_sm\_mail\_host) | Mail server host | `any` | n/a | yes |
| <a name="input_sm_mail_password"></a> [sm\_mail\_password](#input\_sm\_mail\_password) | Mail server password | `any` | n/a | yes |
| <a name="input_sm_mail_port"></a> [sm\_mail\_port](#input\_sm\_mail\_port) | Mail server port | `any` | n/a | yes |
| <a name="input_sm_mail_user"></a> [sm\_mail\_user](#input\_sm\_mail\_user) | Mail server user name | `any` | n/a | yes |
| <a name="input_sm_private_bucket"></a> [sm\_private\_bucket](#input\_sm\_private\_bucket) | Name of the private bucket | `any` | n/a | yes |
| <a name="input_sm_public_bucket"></a> [sm\_public\_bucket](#input\_sm\_public\_bucket) | Name of the public bucket | `any` | n/a | yes |
| <a name="input_sm_redis_host"></a> [sm\_redis\_host](#input\_sm\_redis\_host) | Redis server host | `any` | n/a | yes |
| <a name="input_sm_redis_password"></a> [sm\_redis\_password](#input\_sm\_redis\_password) | Redis server password | `any` | n/a | yes |
| <a name="input_sm_redis_port"></a> [sm\_redis\_port](#input\_sm\_redis\_port) | Redis server port | `any` | n/a | yes |
| <a name="input_sm_redis_user"></a> [sm\_redis\_user](#input\_sm\_redis\_user) | Redis server user name | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_secret_manager_arn"></a> [secret\_manager\_arn](#output\_secret\_manager\_arn) | Get the ARN of the secret manager |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
