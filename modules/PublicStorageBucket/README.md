# PublicStorageBucket

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_aws.dest_region"></a> [aws.dest\_region](#provider\_aws.dest\_region) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.public_replication](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.public_replication](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.replication](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_s3_bucket.public_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.public_destination](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.destination_bucket_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_acl.public_bucket_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_public_access_block.public_access_block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_public_access_block.public_destination_access_block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_replication_configuration.public_replication](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_replication_configuration) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.destination_bucket_encryption](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.public_bucket_encryption](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.public_bucket_versioning](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_s3_bucket_versioning.public_destination](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_kms_key.kms_key_arn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_key) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env_suffix"></a> [env\_suffix](#input\_env\_suffix) | n/a | `any` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | n/a | `any` | n/a | yes |
| <a name="input_public_aws_profile_name"></a> [public\_aws\_profile\_name](#input\_public\_aws\_profile\_name) | n/a | `any` | n/a | yes |
| <a name="input_public_bucket_acceleration"></a> [public\_bucket\_acceleration](#input\_public\_bucket\_acceleration) | n/a | `any` | n/a | yes |
| <a name="input_public_bucket_name"></a> [public\_bucket\_name](#input\_public\_bucket\_name) | n/a | `any` | n/a | yes |
| <a name="input_public_bucket_replication_option"></a> [public\_bucket\_replication\_option](#input\_public\_bucket\_replication\_option) | n/a | `any` | n/a | yes |
| <a name="input_public_bucket_versioning"></a> [public\_bucket\_versioning](#input\_public\_bucket\_versioning) | n/a | `any` | n/a | yes |
| <a name="input_public_destination_bucket_name"></a> [public\_destination\_bucket\_name](#input\_public\_destination\_bucket\_name) | n/a | `any` | n/a | yes |
| <a name="input_public_replication_destination_region"></a> [public\_replication\_destination\_region](#input\_public\_replication\_destination\_region) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_bucket_arn"></a> [public\_bucket\_arn](#output\_public\_bucket\_arn) | n/a |
| <a name="output_public_bucket_domain_name"></a> [public\_bucket\_domain\_name](#output\_public\_bucket\_domain\_name) | n/a |
| <a name="output_public_bucket_name"></a> [public\_bucket\_name](#output\_public\_bucket\_name) | Public Bucket Name |
| <a name="output_public_bucket_region"></a> [public\_bucket\_region](#output\_public\_bucket\_region) | Public Bucket Region |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
