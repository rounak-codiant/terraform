# CodeBuild

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
| [aws_codebuild_project.codebuild_project](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_project) | resource |
| [aws_iam_role.code_build](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.codebuild](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_s3_bucket.codebuild_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.access_block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.bucket_encryption](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.codebuild_bucket_versioning](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.codebuild](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_build_timeout"></a> [build\_timeout](#input\_build\_timeout) | Default code build time out | `any` | n/a | yes |
| <a name="input_codebuild_bucket_name"></a> [codebuild\_bucket\_name](#input\_codebuild\_bucket\_name) | Code build  artifact store s3 bucket name | `any` | n/a | yes |
| <a name="input_codebuild_bucket_versioning"></a> [codebuild\_bucket\_versioning](#input\_codebuild\_bucket\_versioning) | Code build s3 bucket versioning option | `any` | n/a | yes |
| <a name="input_codebuild_compute_type"></a> [codebuild\_compute\_type](#input\_codebuild\_compute\_type) | Code build compute instance type | `any` | n/a | yes |
| <a name="input_codebuild_image"></a> [codebuild\_image](#input\_codebuild\_image) | Default code buiuld image | `any` | n/a | yes |
| <a name="input_codebuild_project_description"></a> [codebuild\_project\_description](#input\_codebuild\_project\_description) | Code build project description | `any` | n/a | yes |
| <a name="input_codebuild_project_name"></a> [codebuild\_project\_name](#input\_codebuild\_project\_name) | Code build project name | `any` | n/a | yes |
| <a name="input_codebuild_role_name"></a> [codebuild\_role\_name](#input\_codebuild\_role\_name) | Code build IAM role name | `any` | n/a | yes |
| <a name="input_codebuild_source_branch"></a> [codebuild\_source\_branch](#input\_codebuild\_source\_branch) | Code commit repo branch to take clone from | `any` | n/a | yes |
| <a name="input_codecommit_arn"></a> [codecommit\_arn](#input\_codecommit\_arn) | Code commit repo ARN | `any` | n/a | yes |
| <a name="input_env_suffix"></a> [env\_suffix](#input\_env\_suffix) | Define project environment | `any` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Define project name | `any` | n/a | yes |
| <a name="input_repo_name"></a> [repo\_name](#input\_repo\_name) | Code commit repo name to take code clone | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_codebuild_bucket"></a> [codebuild\_bucket](#output\_codebuild\_bucket) | Name of the code build artifact store s3 bucket |
| <a name="output_codebuild_bucket_arn"></a> [codebuild\_bucket\_arn](#output\_codebuild\_bucket\_arn) | ARN of the code build artifact store s3 bucket |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
