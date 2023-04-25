# FirewallWAF

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
| [aws_wafv2_web_acl.web_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env_suffix"></a> [env\_suffix](#input\_env\_suffix) | Define project environment | `any` | n/a | yes |
| <a name="input_waf_acl_description"></a> [waf\_acl\_description](#input\_waf\_acl\_description) | wad acl description | `any` | n/a | yes |
| <a name="input_waf_acl_name"></a> [waf\_acl\_name](#input\_waf\_acl\_name) | Name of the waf acl | `any` | n/a | yes |
| <a name="input_waf_acl_scope"></a> [waf\_acl\_scope](#input\_waf\_acl\_scope) | waf acl scope (REGIONAL/CLOUDFRONT) | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_waf_acl_arn"></a> [waf\_acl\_arn](#output\_waf\_acl\_arn) | AWS WAF ACl ARN |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
