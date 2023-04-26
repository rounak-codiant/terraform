# CodePipeline

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
| [aws_codepipeline.codepipeline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codepipeline) | resource |
| [aws_codepipeline_webhook.bar](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codepipeline_webhook) | resource |
| [aws_iam_role.codepipeline_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.codepipeline_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.codepipeline_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_artifact_store_bucket"></a> [artifact\_store\_bucket](#input\_artifact\_store\_bucket) | Pipeline artifact store s3 bucket name | `any` | n/a | yes |
| <a name="input_branch_name"></a> [branch\_name](#input\_branch\_name) | Code commit repo branch name | `any` | n/a | yes |
| <a name="input_bucket_arn"></a> [bucket\_arn](#input\_bucket\_arn) | Pipeline artifact store s3 bucket ARN | `any` | n/a | yes |
| <a name="input_codebuild_project_name"></a> [codebuild\_project\_name](#input\_codebuild\_project\_name) | Code build project name | `any` | n/a | yes |
| <a name="input_codedeploy_app_name"></a> [codedeploy\_app\_name](#input\_codedeploy\_app\_name) | Code deploy application name | `any` | n/a | yes |
| <a name="input_codedeployment_group_name"></a> [codedeployment\_group\_name](#input\_codedeployment\_group\_name) | Code deployment group name | `any` | n/a | yes |
| <a name="input_pipeline_name"></a> [pipeline\_name](#input\_pipeline\_name) | Pipeline name | `any` | n/a | yes |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | Code commit repo name | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
