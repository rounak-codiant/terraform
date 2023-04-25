# StaticWebsite

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
| [aws_s3_bucket.static_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.static_bucket_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_policy.s3_cdn_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.static_access_block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.static_bucket_encryption](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.static_bucket_versioning](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_cloudfront_cache_policy.cache_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/cloudfront_cache_policy) | data source |
| [aws_cloudfront_origin_request_policy.origin_cache_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/cloudfront_origin_request_policy) | data source |
| [aws_iam_policy_document.s3-cdn-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_control_allow_origins"></a> [access\_control\_allow\_origins](#input\_access\_control\_allow\_origins) | Define access control origins | `any` | n/a | yes |
| <a name="input_access_control_max_age"></a> [access\_control\_max\_age](#input\_access\_control\_max\_age) | Define access control max age for security headers policy | `any` | n/a | yes |
| <a name="input_cloudfront_description"></a> [cloudfront\_description](#input\_cloudfront\_description) | Define description CloudFront distribution | `any` | n/a | yes |
| <a name="input_content_security_policy"></a> [content\_security\_policy](#input\_content\_security\_policy) | Define access content security policies for security headers policy | `any` | n/a | yes |
| <a name="input_default_root_object"></a> [default\_root\_object](#input\_default\_root\_object) | Object that you want CloudFront to return (for example, index.html) when an end user requests the root URL | `any` | n/a | yes |
| <a name="input_env_suffix"></a> [env\_suffix](#input\_env\_suffix) | Define project environment | `any` | n/a | yes |
| <a name="input_headers_policy_name"></a> [headers\_policy\_name](#input\_headers\_policy\_name) | Define cloudfront security headers policy name | `any` | n/a | yes |
| <a name="input_http_version"></a> [http\_version](#input\_http\_version) | Maximum HTTP version to support on the distribution | `any` | n/a | yes |
| <a name="input_ipv6_enabled"></a> [ipv6\_enabled](#input\_ipv6\_enabled) | Whether the IPv6 is enabled for the distribution | `any` | n/a | yes |
| <a name="input_objects_compress"></a> [objects\_compress](#input\_objects\_compress) | CloudFront automatically compress objects option | `any` | n/a | yes |
| <a name="input_permissions_policy"></a> [permissions\_policy](#input\_permissions\_policy) | Cloudfront permissions policies | `any` | n/a | yes |
| <a name="input_static_bucket_name"></a> [static\_bucket\_name](#input\_static\_bucket\_name) | Define s3 bucket name for static webside deployment | `any` | n/a | yes |
| <a name="input_static_bucket_versioning"></a> [static\_bucket\_versioning](#input\_static\_bucket\_versioning) | Define s3 bucket versioning option | `any` | n/a | yes |
| <a name="input_waf_acl_id"></a> [waf\_acl\_id](#input\_waf\_acl\_id) | To attach AWS WAF acl | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
