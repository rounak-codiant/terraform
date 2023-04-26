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
| <a name="input_automatic_failover_enabled"></a> [automatic\_failover\_enabled](#input\_automatic\_failover\_enabled) | Read-only replica will be automatically promoted to read/write primary if the existing primary fails | `any` | n/a | yes |
| <a name="input_cachedb_description"></a> [cachedb\_description](#input\_cachedb\_description) | Redis cluster description | `any` | n/a | yes |
| <a name="input_cachedb_engine"></a> [cachedb\_engine](#input\_cachedb\_engine) | Cache database engine | `any` | n/a | yes |
| <a name="input_cachedb_name"></a> [cachedb\_name](#input\_cachedb\_name) | Redis cluster name | `any` | n/a | yes |
| <a name="input_cachedb_node_type"></a> [cachedb\_node\_type](#input\_cachedb\_node\_type) | Cluster instance/node type | `any` | n/a | yes |
| <a name="input_cachedb_port"></a> [cachedb\_port](#input\_cachedb\_port) | Redis server port | `any` | n/a | yes |
| <a name="input_env_suffix"></a> [env\_suffix](#input\_env\_suffix) | Define project environment | `any` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Define project name | `any` | n/a | yes |
| <a name="input_redis_subnets"></a> [redis\_subnets](#input\_redis\_subnets) | Public subnets for subnet group | `any` | n/a | yes |
| <a name="input_redis_user_name"></a> [redis\_user\_name](#input\_redis\_user\_name) | Redis username | `any` | n/a | yes |
| <a name="input_redis_user_pwd"></a> [redis\_user\_pwd](#input\_redis\_user\_pwd) | Redis password | `string` | n/a | yes |
| <a name="input_redis_vpc_id"></a> [redis\_vpc\_id](#input\_redis\_vpc\_id) | VPC id | `any` | n/a | yes |
| <a name="input_rest_encryption_enabled"></a> [rest\_encryption\_enabled](#input\_rest\_encryption\_enabled) | Rest encryption option for cluster | `any` | n/a | yes |
| <a name="input_snapshot_retention_limit"></a> [snapshot\_retention\_limit](#input\_snapshot\_retention\_limit) | Number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them | `any` | n/a | yes |
| <a name="input_transit_encryption_enabled"></a> [transit\_encryption\_enabled](#input\_transit\_encryption\_enabled) | transit encryption option for cluster | `any` | n/a | yes |
| <a name="input_version_upgrade"></a> [version\_upgrade](#input\_version\_upgrade) | Redis cluster version upgrade option | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cache_cluster_host"></a> [cache\_cluster\_host](#output\_cache\_cluster\_host) | Redis cluster host |
| <a name="output_cache_cluster_port"></a> [cache\_cluster\_port](#output\_cache\_cluster\_port) | Redi cluster port |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
