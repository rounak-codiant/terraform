# CloudFront

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
| [aws_cloudfront_distribution.distribution](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_origin_access_identity.access_identity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_identity) | resource |
| [aws_cloudfront_response_headers_policy.headers_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_response_headers_policy) | resource |
| [aws_s3_bucket_policy.s3_cdn_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_cloudfront_cache_policy.cache_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/cloudfront_cache_policy) | data source |
| [aws_cloudfront_origin_request_policy.origin_cache_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/cloudfront_origin_request_policy) | data source |
| [aws_iam_policy_document.s3_cdn_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_control_allow_origins"></a> [access\_control\_allow\_origins](#input\_access\_control\_allow\_origins) | Define access control origins | `any` | n/a | yes |
| <a name="input_access_control_max_age"></a> [access\_control\_max\_age](#input\_access\_control\_max\_age) | Define access control max age for security headers policy | `any` | n/a | yes |
| <a name="input_cloudfront_description"></a> [cloudfront\_description](#input\_cloudfront\_description) | Define description CloudFront distribution | `any` | n/a | yes |
| <a name="input_content_security_policy"></a> [content\_security\_policy](#input\_content\_security\_policy) | Define content security policies for security headers policy | `any` | n/a | yes |
| <a name="input_headers_policy_name"></a> [headers\_policy\_name](#input\_headers\_policy\_name) | Define cloudfront security headers policy name | `any` | n/a | yes |
| <a name="input_http_version"></a> [http\_version](#input\_http\_version) | HTTP version to support the distribution | `any` | n/a | yes |
| <a name="input_ipv6_enabled"></a> [ipv6\_enabled](#input\_ipv6\_enabled) | Whether the IPv6 is enabled for the distribution | `any` | n/a | yes |
| <a name="input_objects_compress"></a> [objects\_compress](#input\_objects\_compress) | CloudFront automatically compress objects option | `any` | n/a | yes |
| <a name="input_permissions_policy"></a> [permissions\_policy](#input\_permissions\_policy) | Cloudfront permissions policies | `any` | n/a | yes |
| <a name="input_s3_bucket_arn"></a> [s3\_bucket\_arn](#input\_s3\_bucket\_arn) | ARN of the S3 bucket | `any` | n/a | yes |
| <a name="input_s3_bucket_domain_name"></a> [s3\_bucket\_domain\_name](#input\_s3\_bucket\_domain\_name) | Domain of the S3 bucket | `any` | n/a | yes |
| <a name="input_s3_bucket_id"></a> [s3\_bucket\_id](#input\_s3\_bucket\_id) | ID of the S3 bucket | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
