# CacheCluster

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
| [aws_elasticache_replication_group.redis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group) | resource |
| [aws_elasticache_subnet_group.subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | resource |
| [aws_elasticache_user.redis_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_user) | resource |
| [aws_elasticache_user_group.redis_user_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_user_group) | resource |
| [aws_security_group.redis_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_automatic_failover_enabled"></a> [automatic\_failover\_enabled](#input\_automatic\_failover\_enabled) | n/a | `any` | n/a | yes |
| <a name="input_cachedb_description"></a> [cachedb\_description](#input\_cachedb\_description) | n/a | `any` | n/a | yes |
| <a name="input_cachedb_engine"></a> [cachedb\_engine](#input\_cachedb\_engine) | n/a | `any` | n/a | yes |
| <a name="input_cachedb_name"></a> [cachedb\_name](#input\_cachedb\_name) | n/a | `any` | n/a | yes |
| <a name="input_cachedb_node_type"></a> [cachedb\_node\_type](#input\_cachedb\_node\_type) | n/a | `any` | n/a | yes |
| <a name="input_cachedb_port"></a> [cachedb\_port](#input\_cachedb\_port) | n/a | `any` | n/a | yes |
| <a name="input_cachedb_snapshot_retention_limit"></a> [cachedb\_snapshot\_retention\_limit](#input\_cachedb\_snapshot\_retention\_limit) | n/a | `any` | n/a | yes |
| <a name="input_env_suffix"></a> [env\_suffix](#input\_env\_suffix) | n/a | `any` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | n/a | `any` | n/a | yes |
| <a name="input_redis_subnets"></a> [redis\_subnets](#input\_redis\_subnets) | n/a | `any` | n/a | yes |
| <a name="input_redis_user_name"></a> [redis\_user\_name](#input\_redis\_user\_name) | n/a | `any` | n/a | yes |
| <a name="input_redis_user_pwd"></a> [redis\_user\_pwd](#input\_redis\_user\_pwd) | n/a | `string` | n/a | yes |
| <a name="input_redis_vpc_id"></a> [redis\_vpc\_id](#input\_redis\_vpc\_id) | n/a | `any` | n/a | yes |
| <a name="input_rest_encryption_enabled"></a> [rest\_encryption\_enabled](#input\_rest\_encryption\_enabled) | n/a | `any` | n/a | yes |
| <a name="input_snapshot_retention_limit"></a> [snapshot\_retention\_limit](#input\_snapshot\_retention\_limit) | n/a | `any` | n/a | yes |
| <a name="input_transit_encryption_enabled"></a> [transit\_encryption\_enabled](#input\_transit\_encryption\_enabled) | n/a | `any` | n/a | yes |
| <a name="input_version_upgrade"></a> [version\_upgrade](#input\_version\_upgrade) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cache_cluster_host"></a> [cache\_cluster\_host](#output\_cache\_cluster\_host) | n/a |
| <a name="output_cache_cluster_port"></a> [cache\_cluster\_port](#output\_cache\_cluster\_port) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
