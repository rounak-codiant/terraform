# LoadBalancer

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
| [aws_alb_listener.application_lb_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_listener) | resource |
| [aws_alb_target_group.application_tg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group) | resource |
| [aws_lb.application_lb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_target_group_attachment.register_instance_tg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |
| [aws_s3_bucket.elb_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_policy.allow_elb_logging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.alb_access_block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.alb_bucket_encryption](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.alb_public_bucket_versioning](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_security_group.alb_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_caller_identity.account_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_elb_service_account.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/elb_service_account) | data source |
| [aws_iam_policy_document.allow_elb_logging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_bucket_versioning"></a> [alb\_bucket\_versioning](#input\_alb\_bucket\_versioning) | Load lalancer bucket versioning option | `any` | n/a | yes |
| <a name="input_alb_idle_timeout"></a> [alb\_idle\_timeout](#input\_alb\_idle\_timeout) | Load balancer default idle timeout | `any` | n/a | yes |
| <a name="input_alb_log_prefix"></a> [alb\_log\_prefix](#input\_alb\_log\_prefix) | Load balancer logs prefix | `any` | n/a | yes |
| <a name="input_alb_logs_bucket_name"></a> [alb\_logs\_bucket\_name](#input\_alb\_logs\_bucket\_name) | S3 bucket name for log store | `any` | n/a | yes |
| <a name="input_alb_logs_enable"></a> [alb\_logs\_enable](#input\_alb\_logs\_enable) | Load balancer access logs option | `any` | n/a | yes |
| <a name="input_alb_vpc_id"></a> [alb\_vpc\_id](#input\_alb\_vpc\_id) | VPC id for load balancer | `any` | n/a | yes |
| <a name="input_env_suffix"></a> [env\_suffix](#input\_env\_suffix) | Define project environment | `any` | n/a | yes |
| <a name="input_lb_deletion_protection"></a> [lb\_deletion\_protection](#input\_lb\_deletion\_protection) | Load balancer delete protection option | `any` | n/a | yes |
| <a name="input_lb_internal"></a> [lb\_internal](#input\_lb\_internal) | Load balancer internal option | `any` | n/a | yes |
| <a name="input_lb_listener_port"></a> [lb\_listener\_port](#input\_lb\_listener\_port) | Load balancer listener default port | `any` | n/a | yes |
| <a name="input_lb_listener_protocol"></a> [lb\_listener\_protocol](#input\_lb\_listener\_protocol) | Load balancer listener default protocol | `any` | n/a | yes |
| <a name="input_lb_name"></a> [lb\_name](#input\_lb\_name) | Name of the load balancer | `any` | n/a | yes |
| <a name="input_lb_subnets"></a> [lb\_subnets](#input\_lb\_subnets) | Public subets id for load balancer | `any` | n/a | yes |
| <a name="input_lb_target_id"></a> [lb\_target\_id](#input\_lb\_target\_id) | EC2 instance id to attach it with targer group | `any` | n/a | yes |
| <a name="input_lb_tg_health_check_matcher"></a> [lb\_tg\_health\_check\_matcher](#input\_lb\_tg\_health\_check\_matcher) | HTTP codes to use when checking for a successful response from a target | `any` | n/a | yes |
| <a name="input_lb_tg_health_check_path"></a> [lb\_tg\_health\_check\_path](#input\_lb\_tg\_health\_check\_path) | Default health check path | `any` | n/a | yes |
| <a name="input_lb_tg_health_check_port"></a> [lb\_tg\_health\_check\_port](#input\_lb\_tg\_health\_check\_port) | Default health check port | `any` | n/a | yes |
| <a name="input_lb_tg_health_check_protocol"></a> [lb\_tg\_health\_check\_protocol](#input\_lb\_tg\_health\_check\_protocol) | Load balancer health check protocol | `any` | n/a | yes |
| <a name="input_lb_type"></a> [lb\_type](#input\_lb\_type) | Load balancer type | `any` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Define project name | `any` | n/a | yes |
| <a name="input_tg_name"></a> [tg\_name](#input\_tg\_name) | Name of the target group | `any` | n/a | yes |
| <a name="input_tg_port"></a> [tg\_port](#input\_tg\_port) | Target group port | `any` | n/a | yes |
| <a name="input_tg_protocol"></a> [tg\_protocol](#input\_tg\_protocol) | Target group protocol (HTTP/HTTPS) | `any` | n/a | yes |
| <a name="input_tg_target_type"></a> [tg\_target\_type](#input\_tg\_target\_type) | Target group target type | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_id"></a> [alb\_id](#output\_alb\_id) | Load balancer ID |
| <a name="output_target_group_arn"></a> [target\_group\_arn](#output\_target\_group\_arn) | Load balancer ARN |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
