# PrivateStorageBucket

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
| [aws_iam_policy.replication](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.replication](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.replication](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_s3_bucket.destination](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.private_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.destination_access_block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_public_access_block.public_access_block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_replication_configuration.replication](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_replication_configuration) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.destination_bucket_encryption](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.private_bucket_encryption](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.destination](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_s3_bucket_versioning.private_bucket_versioning](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_kms_key.kms_key_arn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_key) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env_suffix"></a> [env\_suffix](#input\_env\_suffix) | Define project environment | `any` | n/a | yes |
| <a name="input_private_aws_profile_name"></a> [private\_aws\_profile\_name](#input\_private\_aws\_profile\_name) | Name of the AWS profile | `any` | n/a | yes |
| <a name="input_private_bucket_acceleration"></a> [private\_bucket\_acceleration](#input\_private\_bucket\_acceleration) | Private bucket acceleration option | `any` | n/a | yes |
| <a name="input_private_bucket_name"></a> [private\_bucket\_name](#input\_private\_bucket\_name) | Name of the private bucket | `any` | n/a | yes |
| <a name="input_private_bucket_replication_option"></a> [private\_bucket\_replication\_option](#input\_private\_bucket\_replication\_option) | Private bucket replica option | `any` | n/a | yes |
| <a name="input_private_bucket_versioning"></a> [private\_bucket\_versioning](#input\_private\_bucket\_versioning) | Private bucket versioning option | `any` | n/a | yes |
| <a name="input_private_destination_bucket_name"></a> [private\_destination\_bucket\_name](#input\_private\_destination\_bucket\_name) | Private bucket replica bucket name | `any` | n/a | yes |
| <a name="input_private_replication_destination_region"></a> [private\_replication\_destination\_region](#input\_private\_replication\_destination\_region) | Private bucket replica bucket region | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_bucket_arn"></a> [private\_bucket\_arn](#output\_private\_bucket\_arn) | Private Bucket ARN |
| <a name="output_private_bucket_domain_name"></a> [private\_bucket\_domain\_name](#output\_private\_bucket\_domain\_name) | Private Bucket endpoint url |
| <a name="output_private_bucket_name"></a> [private\_bucket\_name](#output\_private\_bucket\_name) | private Bucket Name |
| <a name="output_private_bucket_region"></a> [private\_bucket\_region](#output\_private\_bucket\_region) | private Bucket Region |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
