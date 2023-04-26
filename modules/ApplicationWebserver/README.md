# ApplicationWebserver

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.application_eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eip_association.application_eip_assoc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip_association) | resource |
| [aws_iam_instance_profile.ec2_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_policy.ec2_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_attachment.ec2_policy_attached](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_role.ec2_s3_sm_access_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_instance.web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_key_pair.keypair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_security_group.application_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [tls_private_key.key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [aws_ami.instance_ami](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_name"></a> [ami\_name](#input\_ami\_name) | Name of the instance AMI | `any` | n/a | yes |
| <a name="input_composer_install"></a> [composer\_install](#input\_composer\_install) | Composer install on server or not | `any` | n/a | yes |
| <a name="input_ebs_volume_size"></a> [ebs\_volume\_size](#input\_ebs\_volume\_size) | EBS volume size | `any` | n/a | yes |
| <a name="input_ebs_volume_type"></a> [ebs\_volume\_type](#input\_ebs\_volume\_type) | EC2 EBS type | `any` | n/a | yes |
| <a name="input_ec2_monitoring"></a> [ec2\_monitoring](#input\_ec2\_monitoring) | Instance monitoring option | `any` | n/a | yes |
| <a name="input_ec2_policy_name"></a> [ec2\_policy\_name](#input\_ec2\_policy\_name) | Instance IAM policy name | `any` | n/a | yes |
| <a name="input_ec2_role_name"></a> [ec2\_role\_name](#input\_ec2\_role\_name) | Instance IAM role name | `any` | n/a | yes |
| <a name="input_ec2_subnet_id"></a> [ec2\_subnet\_id](#input\_ec2\_subnet\_id) | Instance public subnet id | `any` | n/a | yes |
| <a name="input_env_suffix"></a> [env\_suffix](#input\_env\_suffix) | Define project environment | `any` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Application server instance type | `any` | n/a | yes |
| <a name="input_key_pair_name"></a> [key\_pair\_name](#input\_key\_pair\_name) | Instance ssh pem file name | `any` | n/a | yes |
| <a name="input_node_nginx_config"></a> [node\_nginx\_config](#input\_node\_nginx\_config) | Nginx configuration for Node | `any` | n/a | yes |
| <a name="input_node_version"></a> [node\_version](#input\_node\_version) | Define Node version to install it on server | `any` | n/a | yes |
| <a name="input_php_module"></a> [php\_module](#input\_php\_module) | PHP module install or not | `any` | n/a | yes |
| <a name="input_php_nginx_config"></a> [php\_nginx\_config](#input\_php\_nginx\_config) | Nginx configuration for PHP | `any` | n/a | yes |
| <a name="input_php_version"></a> [php\_version](#input\_php\_version) | Define PHP version to install it on server | `any` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Define project name | `any` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_application_instance_eip"></a> [application\_instance\_eip](#output\_application\_instance\_eip) | Application instance Public IP address |
| <a name="output_application_sg_id"></a> [application\_sg\_id](#output\_application\_sg\_id) | Application security group id |
| <a name="output_ec2_private_key"></a> [ec2\_private\_key](#output\_ec2\_private\_key) | SSH key |
| <a name="output_ec2_role_arn"></a> [ec2\_role\_arn](#output\_ec2\_role\_arn) | EC2 role ARN |
| <a name="output_web_instance_id"></a> [web\_instance\_id](#output\_web\_instance\_id) | Application server id |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
