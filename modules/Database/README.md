# Database

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
| [aws_db_parameter_group.db_instance_pg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group) | resource |
| [aws_db_subnet_group.subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_rds_cluster.database_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster) | resource |
| [aws_rds_cluster_instance.database_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_instance) | resource |
| [aws_rds_cluster_parameter_group.cluster_pg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_parameter_group) | resource |
| [aws_security_group.database_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_major_version_upgrade"></a> [allow\_major\_version\_upgrade](#input\_allow\_major\_version\_upgrade) | n/a | `any` | n/a | yes |
| <a name="input_cluster_parameter_group"></a> [cluster\_parameter\_group](#input\_cluster\_parameter\_group) | n/a | `any` | n/a | yes |
| <a name="input_cluster_parameter_group_family"></a> [cluster\_parameter\_group\_family](#input\_cluster\_parameter\_group\_family) | n/a | `any` | n/a | yes |
| <a name="input_copy_tags_to_snapshot"></a> [copy\_tags\_to\_snapshot](#input\_copy\_tags\_to\_snapshot) | n/a | `any` | n/a | yes |
| <a name="input_database_backup_retention_period"></a> [database\_backup\_retention\_period](#input\_database\_backup\_retention\_period) | n/a | `any` | n/a | yes |
| <a name="input_database_cluster_engine_version"></a> [database\_cluster\_engine\_version](#input\_database\_cluster\_engine\_version) | n/a | `any` | n/a | yes |
| <a name="input_database_cluster_identifier"></a> [database\_cluster\_identifier](#input\_database\_cluster\_identifier) | n/a | `any` | n/a | yes |
| <a name="input_database_cluster_skip_final_snapshot"></a> [database\_cluster\_skip\_final\_snapshot](#input\_database\_cluster\_skip\_final\_snapshot) | n/a | `any` | n/a | yes |
| <a name="input_database_engine"></a> [database\_engine](#input\_database\_engine) | n/a | `any` | n/a | yes |
| <a name="input_database_instance_class"></a> [database\_instance\_class](#input\_database\_instance\_class) | n/a | `any` | n/a | yes |
| <a name="input_database_instance_identifier"></a> [database\_instance\_identifier](#input\_database\_instance\_identifier) | n/a | `any` | n/a | yes |
| <a name="input_database_master_password"></a> [database\_master\_password](#input\_database\_master\_password) | n/a | `any` | n/a | yes |
| <a name="input_database_master_username"></a> [database\_master\_username](#input\_database\_master\_username) | n/a | `any` | n/a | yes |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | n/a | `any` | n/a | yes |
| <a name="input_database_subnet_ids"></a> [database\_subnet\_ids](#input\_database\_subnet\_ids) | n/a | `any` | n/a | yes |
| <a name="input_database_vpc_id"></a> [database\_vpc\_id](#input\_database\_vpc\_id) | n/a | `any` | n/a | yes |
| <a name="input_db_instance_pg_name"></a> [db\_instance\_pg\_name](#input\_db\_instance\_pg\_name) | n/a | `any` | n/a | yes |
| <a name="input_db_parameter_group_family"></a> [db\_parameter\_group\_family](#input\_db\_parameter\_group\_family) | n/a | `any` | n/a | yes |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | n/a | `any` | n/a | yes |
| <a name="input_env_suffix"></a> [env\_suffix](#input\_env\_suffix) | n/a | `any` | n/a | yes |
| <a name="input_general_log"></a> [general\_log](#input\_general\_log) | n/a | `any` | n/a | yes |
| <a name="input_long_query_time"></a> [long\_query\_time](#input\_long\_query\_time) | n/a | `any` | n/a | yes |
| <a name="input_max_allowed_packet"></a> [max\_allowed\_packet](#input\_max\_allowed\_packet) | n/a | `any` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | n/a | `any` | n/a | yes |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | n/a | `any` | n/a | yes |
| <a name="input_slow_query_log"></a> [slow\_query\_log](#input\_slow\_query\_log) | n/a | `any` | n/a | yes |
| <a name="input_snapshot_identifier_name"></a> [snapshot\_identifier\_name](#input\_snapshot\_identifier\_name) | n/a | `any` | n/a | yes |
| <a name="input_storage_encrypted"></a> [storage\_encrypted](#input\_storage\_encrypted) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_database_cluster_database_name"></a> [database\_cluster\_database\_name](#output\_database\_cluster\_database\_name) | n/a |
| <a name="output_database_cluster_engine"></a> [database\_cluster\_engine](#output\_database\_cluster\_engine) | n/a |
| <a name="output_database_cluster_host"></a> [database\_cluster\_host](#output\_database\_cluster\_host) | n/a |
| <a name="output_database_cluster_password"></a> [database\_cluster\_password](#output\_database\_cluster\_password) | n/a |
| <a name="output_database_cluster_port"></a> [database\_cluster\_port](#output\_database\_cluster\_port) | n/a |
| <a name="output_database_cluster_user"></a> [database\_cluster\_user](#output\_database\_cluster\_user) | n/a |
| <a name="output_database_security_group"></a> [database\_security\_group](#output\_database\_security\_group) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
