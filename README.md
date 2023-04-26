# Terraform

- Website: https://www.terraform.io
- Forums: [HashiCorp Discuss](https://discuss.hashicorp.com/c/terraform-core)
- Documentation: [https://www.terraform.io/docs/](https://www.terraform.io/docs/)
- Tutorials: [HashiCorp's Learn Platform](https://learn.hashicorp.com/terraform)
- Certification Exam: [HashiCorp Certified: Terraform Associate](https://www.hashicorp.com/certification/#hashicorp-certified-terraform-associate)

<img alt="Terraform" src="https://www.datocms-assets.com/2885/1629941242-logo-terraform-main.svg" width="600px">

--------------------------------------

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.48.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_application_server"></a> [application\_server](#module\_application\_server) | ./modules/ApplicationWebserver | n/a |
| <a name="module_cache_database"></a> [cache\_database](#module\_cache\_database) | ./modules/CacheCluster | n/a |
| <a name="module_codebuild"></a> [codebuild](#module\_codebuild) | ./modules/CodeBuild | n/a |
| <a name="module_codecommit"></a> [codecommit](#module\_codecommit) | ./modules/CodeCommit | n/a |
| <a name="module_codedeploy"></a> [codedeploy](#module\_codedeploy) | ./modules/CodeDeploy | n/a |
| <a name="module_codepipeline"></a> [codepipeline](#module\_codepipeline) | ./modules/CodePipeline | n/a |
| <a name="module_database"></a> [database](#module\_database) | ./modules/Database | n/a |
| <a name="module_firewall_waf_alb"></a> [firewall\_waf\_alb](#module\_firewall\_waf\_alb) | ./modules/FirewallWAF | n/a |
| <a name="module_firewall_waf_cdn"></a> [firewall\_waf\_cdn](#module\_firewall\_waf\_cdn) | ./modules/FirewallWAF | n/a |
| <a name="module_load_balancer"></a> [load\_balancer](#module\_load\_balancer) | ./modules/LoadBalancer | n/a |
| <a name="module_private_bucket"></a> [private\_bucket](#module\_private\_bucket) | ./modules/PrivateStorageBucket | n/a |
| <a name="module_private_cloudfront"></a> [private\_cloudfront](#module\_private\_cloudfront) | ./modules/CloudFront | n/a |
| <a name="module_public_bucket"></a> [public\_bucket](#module\_public\_bucket) | ./modules/PublicStorageBucket | n/a |
| <a name="module_public_cloudfront"></a> [public\_cloudfront](#module\_public\_cloudfront) | ./modules/CloudFront | n/a |
| <a name="module_secret_manager"></a> [secret\_manager](#module\_secret\_manager) | ./modules/SecretManagement | n/a |
| <a name="module_static_website"></a> [static\_website](#module\_static\_website) | ./modules/StaticWebsite | n/a |
| <a name="module_terraform_backend"></a> [terraform\_backend](#module\_terraform\_backend) | ./modules/TF_Backend | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/VPC | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_bucket_versioning"></a> [alb\_bucket\_versioning](#input\_alb\_bucket\_versioning) | Load lalancer logs s3 bucket versioning | `string` | `"Enabled"` | no |
| <a name="input_alb_idle_timeout"></a> [alb\_idle\_timeout](#input\_alb\_idle\_timeout) | Load balancer maximum idle timeout | `string` | `"120"` | no |
| <a name="input_alb_log_prefix"></a> [alb\_log\_prefix](#input\_alb\_log\_prefix) | Load balancer logs prefix | `string` | `"ALB"` | no |
| <a name="input_alb_logs_bucket_name"></a> [alb\_logs\_bucket\_name](#input\_alb\_logs\_bucket\_name) | Load balancer logs s3 bucket name | `string` | `"alb-logs-bucket"` | no |
| <a name="input_alb_logs_enable"></a> [alb\_logs\_enable](#input\_alb\_logs\_enable) | Enable load balancer access logs | `string` | `"true"` | no |
| <a name="input_alb_waf_acl_description"></a> [alb\_waf\_acl\_description](#input\_alb\_waf\_acl\_description) | ALB WAF acl description | `string` | `"Application Load Balancer Waf ACL"` | no |
| <a name="input_alb_waf_acl_name"></a> [alb\_waf\_acl\_name](#input\_alb\_waf\_acl\_name) | Name of the Application load balancer waf acl | `string` | `"alb-waf-acl"` | no |
| <a name="input_allow_major_version_upgrade"></a> [allow\_major\_version\_upgrade](#input\_allow\_major\_version\_upgrade) | Database version upgrade | `string` | `"false"` | no |
| <a name="input_ami_name"></a> [ami\_name](#input\_ami\_name) | Instance AMI | `string` | `"ubuntu/images/hvm-ssd/ubuntu-jammy-*arm64"` | no |
| <a name="input_automatic_failover_enabled"></a> [automatic\_failover\_enabled](#input\_automatic\_failover\_enabled) | Read-only replica promoted to read/write primary if the existing primary fails | `string` | `"false"` | no |
| <a name="input_aws_profile_name"></a> [aws\_profile\_name](#input\_aws\_profile\_name) | Name of the AWS profile | `string` | `""` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region | `string` | `"us-east-1"` | no |
| <a name="input_build_timeout"></a> [build\_timeout](#input\_build\_timeout) | Build time out | `string` | `"15"` | no |
| <a name="input_cachedb_description"></a> [cachedb\_description](#input\_cachedb\_description) | Cache database cluster description | `string` | `"Redis Database"` | no |
| <a name="input_cachedb_engine"></a> [cachedb\_engine](#input\_cachedb\_engine) | Cache database engine | `string` | `"redis"` | no |
| <a name="input_cachedb_name"></a> [cachedb\_name](#input\_cachedb\_name) | Cache database cluster name | `string` | `"redis-cache"` | no |
| <a name="input_cachedb_node_type"></a> [cachedb\_node\_type](#input\_cachedb\_node\_type) | Cache database cluster node type | `string` | `"cache.t3.small"` | no |
| <a name="input_cachedb_port"></a> [cachedb\_port](#input\_cachedb\_port) | Port number for cache database server | `string` | `"6379"` | no |
| <a name="input_cdn_waf_acl_description"></a> [cdn\_waf\_acl\_description](#input\_cdn\_waf\_acl\_description) | CDN WAF acl description | `string` | `"CloudFront Waf ACL"` | no |
| <a name="input_cdn_waf_acl_name"></a> [cdn\_waf\_acl\_name](#input\_cdn\_waf\_acl\_name) | Name of the ClodFront waf acl | `string` | `"cdn-waf-acl"` | no |
| <a name="input_cluster_parameter_group"></a> [cluster\_parameter\_group](#input\_cluster\_parameter\_group) | Database cluster parameter group name | `string` | `"cluster-parameter-group"` | no |
| <a name="input_cluster_parameter_group_family"></a> [cluster\_parameter\_group\_family](#input\_cluster\_parameter\_group\_family) | Database cluster parameter group family | `string` | `"aurora-mysql5.7"` | no |
| <a name="input_codebuild_bucket_name"></a> [codebuild\_bucket\_name](#input\_codebuild\_bucket\_name) | Code build  artifact store s3 bucket name | `string` | `"codebuild1243"` | no |
| <a name="input_codebuild_bucket_versioning"></a> [codebuild\_bucket\_versioning](#input\_codebuild\_bucket\_versioning) | Enable code build s3 bucket versioning | `string` | `"Enabled"` | no |
| <a name="input_codebuild_compute_type"></a> [codebuild\_compute\_type](#input\_codebuild\_compute\_type) | You can select (BUILD\_GENERAL1\_SMALL, BUILD\_GENERAL1\_MEDIUM, BUILD\_GENERAL1\_LARGE, BUILD\_GENERAL1\_2XLARGE) | `string` | `"BUILD_GENERAL1_SMALL"` | no |
| <a name="input_codebuild_image"></a> [codebuild\_image](#input\_codebuild\_image) | You can select (aws/codebuild/standard:6.0, aws/codebuild/standard:5.0, aws/codebuild/standard:4.0) | `string` | `"aws/codebuild/standard:6.0"` | no |
| <a name="input_codebuild_project_description"></a> [codebuild\_project\_description](#input\_codebuild\_project\_description) | Code build project description | `string` | `"Code Build Project"` | no |
| <a name="input_codebuild_project_name"></a> [codebuild\_project\_name](#input\_codebuild\_project\_name) | Code build project name | `string` | `"code-build-project"` | no |
| <a name="input_codebuild_role_name"></a> [codebuild\_role\_name](#input\_codebuild\_role\_name) | Code build IAM role name | `string` | `"codebuild-role"` | no |
| <a name="input_codecommit_user_name"></a> [codecommit\_user\_name](#input\_codecommit\_user\_name) | Code commit user name | `string` | `"codecommit"` | no |
| <a name="input_codedeploy_app_name"></a> [codedeploy\_app\_name](#input\_codedeploy\_app\_name) | Code deploy application name | `string` | `"CodedDeploy-App"` | no |
| <a name="input_codedeploy_service_role_name"></a> [codedeploy\_service\_role\_name](#input\_codedeploy\_service\_role\_name) | Code deploy service role name | `string` | `"CodeDeploy-Serivce-Role"` | no |
| <a name="input_composer_install"></a> [composer\_install](#input\_composer\_install) | Composer install on server or not | `string` | `"yes"` | no |
| <a name="input_copy_tags_to_snapshot"></a> [copy\_tags\_to\_snapshot](#input\_copy\_tags\_to\_snapshot) | Databse snapshot tag as cluster | `string` | `"true"` | no |
| <a name="input_database_backup_retention_period"></a> [database\_backup\_retention\_period](#input\_database\_backup\_retention\_period) | Database backup retention time | `string` | `"7"` | no |
| <a name="input_database_cluster_engine_version"></a> [database\_cluster\_engine\_version](#input\_database\_cluster\_engine\_version) | Database cluster engine | `string` | `"5.7.mysql_aurora.2.07.2"` | no |
| <a name="input_database_cluster_identifier"></a> [database\_cluster\_identifier](#input\_database\_cluster\_identifier) | Database cluster name | `string` | `"database-cluster"` | no |
| <a name="input_database_cluster_skip_final_snapshot"></a> [database\_cluster\_skip\_final\_snapshot](#input\_database\_cluster\_skip\_final\_snapshot) | Databse cluster final snapshot true/false | `string` | `"true"` | no |
| <a name="input_database_engine"></a> [database\_engine](#input\_database\_engine) | Database engine | `string` | `"aurora-mysql"` | no |
| <a name="input_database_instance_class"></a> [database\_instance\_class](#input\_database\_instance\_class) | Database instance type | `string` | `"db.t3.medium"` | no |
| <a name="input_database_instance_identifier"></a> [database\_instance\_identifier](#input\_database\_instance\_identifier) | Database instance name | `string` | `"database-instance"` | no |
| <a name="input_database_master_password"></a> [database\_master\_password](#input\_database\_master\_password) | Database master password | `string` | `"admin@password"` | no |
| <a name="input_database_master_username"></a> [database\_master\_username](#input\_database\_master\_username) | Database master username | `string` | `"admin"` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | Database name | `string` | `"database_name"` | no |
| <a name="input_db_instance_pg_name"></a> [db\_instance\_pg\_name](#input\_db\_instance\_pg\_name) | Database instance parameter group name | `string` | `"db-instance-parameter-group"` | no |
| <a name="input_db_parameter_group_family"></a> [db\_parameter\_group\_family](#input\_db\_parameter\_group\_family) | Database instance parameter group family | `string` | `"aurora-mysql5.7"` | no |
| <a name="input_default_root_object"></a> [default\_root\_object](#input\_default\_root\_object) | Object that you want CloudFront to return when an end user requests the root URL | `string` | `"index.html"` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Database cluster delete protection | `string` | `"true"` | no |
| <a name="input_deployment_group_name"></a> [deployment\_group\_name](#input\_deployment\_group\_name) | Code deploy deployment group name | `string` | `"Deployment-Group"` | no |
| <a name="input_ebs_volume_size"></a> [ebs\_volume\_size](#input\_ebs\_volume\_size) | EBS Storage Capacity/Size | `string` | `"30"` | no |
| <a name="input_ebs_volume_type"></a> [ebs\_volume\_type](#input\_ebs\_volume\_type) | EC2 EBS type | `string` | `"gp2"` | no |
| <a name="input_ec2_monitoring"></a> [ec2\_monitoring](#input\_ec2\_monitoring) | Instance monitoring option | `string` | `"true"` | no |
| <a name="input_ec2_policy_name"></a> [ec2\_policy\_name](#input\_ec2\_policy\_name) | Instance IAM policy name | `string` | `"ec2-role-policy"` | no |
| <a name="input_ec2_role_name"></a> [ec2\_role\_name](#input\_ec2\_role\_name) | Instance IAM role name | `string` | `"ec2-role"` | no |
| <a name="input_enable_dns_hostnames"></a> [enable\_dns\_hostnames](#input\_enable\_dns\_hostnames) | DNS hostnames in the VPC | `string` | `"true"` | no |
| <a name="input_env_suffix"></a> [env\_suffix](#input\_env\_suffix) | Project environment | `string` | `"test"` | no |
| <a name="input_general_log"></a> [general\_log](#input\_general\_log) | Database general log monitoring | `string` | `"1"` | no |
| <a name="input_http_version"></a> [http\_version](#input\_http\_version) | We can use (http1.1, http2, http2and3, http3) | `string` | `"http2and3"` | no |
| <a name="input_iam_force_destroy"></a> [iam\_force\_destroy](#input\_iam\_force\_destroy) | Enable code commit IAM user destroy | `string` | `"true"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Application server instance type | `string` | `"t2.micro"` | no |
| <a name="input_instances_terminate_time"></a> [instances\_terminate\_time](#input\_instances\_terminate\_time) | EC2 instance terminate time after the deployment success | `string` | `"5"` | no |
| <a name="input_ipv6_enabled"></a> [ipv6\_enabled](#input\_ipv6\_enabled) | Whether the IPv6 is enabled for the distribution | `string` | `"true"` | no |
| <a name="input_key_pair_name"></a> [key\_pair\_name](#input\_key\_pair\_name) | Name of EC2 SSh Key Pair | `string` | `"pemkey"` | no |
| <a name="input_lb_deletion_protection"></a> [lb\_deletion\_protection](#input\_lb\_deletion\_protection) | Enable load balancer delete protection | `string` | `"true"` | no |
| <a name="input_lb_internal"></a> [lb\_internal](#input\_lb\_internal) | false value will create public load balancer and true value will create internal load balancer | `string` | `"false"` | no |
| <a name="input_lb_listener_port"></a> [lb\_listener\_port](#input\_lb\_listener\_port) | Load balancer listener port | `string` | `"80"` | no |
| <a name="input_lb_listener_protocol"></a> [lb\_listener\_protocol](#input\_lb\_listener\_protocol) | Load balancer listener protocol | `string` | `"HTTP"` | no |
| <a name="input_lb_name"></a> [lb\_name](#input\_lb\_name) | Name of the load balancer | `string` | `"alb-terraform-1"` | no |
| <a name="input_lb_tg_health_check_matcher"></a> [lb\_tg\_health\_check\_matcher](#input\_lb\_tg\_health\_check\_matcher) | Target group health check status code | `string` | `"200"` | no |
| <a name="input_lb_tg_health_check_path"></a> [lb\_tg\_health\_check\_path](#input\_lb\_tg\_health\_check\_path) | Target group health check path | `string` | `"/"` | no |
| <a name="input_lb_tg_health_check_port"></a> [lb\_tg\_health\_check\_port](#input\_lb\_tg\_health\_check\_port) | Target group health check port | `string` | `"80"` | no |
| <a name="input_lb_tg_health_check_protocol"></a> [lb\_tg\_health\_check\_protocol](#input\_lb\_tg\_health\_check\_protocol) | Target group health check protocol | `string` | `"HTTP"` | no |
| <a name="input_lb_type"></a> [lb\_type](#input\_lb\_type) | Load balancer type. Valid values are 'application' or 'network' | `string` | `"application"` | no |
| <a name="input_long_query_time"></a> [long\_query\_time](#input\_long\_query\_time) | Maximum time to run long query | `string` | `"10"` | no |
| <a name="input_max_allowed_packet"></a> [max\_allowed\_packet](#input\_max\_allowed\_packet) | Maximum allowed packet | `string` | `"64000000"` | no |
| <a name="input_node_nginx_config"></a> [node\_nginx\_config](#input\_node\_nginx\_config) | Nginx configuration for Node | `string` | `"no"` | no |
| <a name="input_node_version"></a> [node\_version](#input\_node\_version) | Node version to install on server | `string` | `"16"` | no |
| <a name="input_objects_compress"></a> [objects\_compress](#input\_objects\_compress) | Enable objects compress | `string` | `"true"` | no |
| <a name="input_php_module"></a> [php\_module](#input\_php\_module) | PHP module install or not | `string` | `"yes"` | no |
| <a name="input_php_nginx_config"></a> [php\_nginx\_config](#input\_php\_nginx\_config) | Nginx configuration for PHP | `string` | `"yes"` | no |
| <a name="input_php_version"></a> [php\_version](#input\_php\_version) | PHP version to install on server | `string` | `"8.1"` | no |
| <a name="input_pipeline_name"></a> [pipeline\_name](#input\_pipeline\_name) | Pipeline name | `string` | `"CodePipeline"` | no |
| <a name="input_private_access_control_allow_origins"></a> [private\_access\_control\_allow\_origins](#input\_private\_access\_control\_allow\_origins) | Define access control origins | `string` | `"*.test.com"` | no |
| <a name="input_private_access_control_max_age"></a> [private\_access\_control\_max\_age](#input\_private\_access\_control\_max\_age) | Define access control max age for security headers policy | `string` | `"31536000"` | no |
| <a name="input_private_bucket_acceleration"></a> [private\_bucket\_acceleration](#input\_private\_bucket\_acceleration) | Private bucket acceleration option | `string` | `"Suspended"` | no |
| <a name="input_private_bucket_name"></a> [private\_bucket\_name](#input\_private\_bucket\_name) | Name of the private bucket | `string` | `"private-bucket-terraform-1"` | no |
| <a name="input_private_bucket_replication_option"></a> [private\_bucket\_replication\_option](#input\_private\_bucket\_replication\_option) | Private bucket replica Enabled/Disabled | `string` | `"Enabled"` | no |
| <a name="input_private_bucket_versioning"></a> [private\_bucket\_versioning](#input\_private\_bucket\_versioning) | Private bucket versioning Enabled/Disabled | `string` | `"Enabled"` | no |
| <a name="input_private_cidr_block"></a> [private\_cidr\_block](#input\_private\_cidr\_block) | Private subnet CIDR blocks | `list(string)` | <pre>[<br>  "20.0.48.0/20",<br>  "20.0.64.0/20",<br>  "20.0.80.0/20"<br>]</pre> | no |
| <a name="input_private_cloudfront_description"></a> [private\_cloudfront\_description](#input\_private\_cloudfront\_description) | Private CloudFront distribution description | `string` | `"Private CloudFront Distribution"` | no |
| <a name="input_private_content_security_policy"></a> [private\_content\_security\_policy](#input\_private\_content\_security\_policy) | Security headers content security policies | `string` | `"default-src 'none'; img-src 'self'; script-src 'self'; style-src 'self'; object-src 'none'"` | no |
| <a name="input_private_destination_bucket_name"></a> [private\_destination\_bucket\_name](#input\_private\_destination\_bucket\_name) | Private bucket replica bucket name | `string` | `"private-bucket-replica-bucket"` | no |
| <a name="input_private_headers_policy_name"></a> [private\_headers\_policy\_name](#input\_private\_headers\_policy\_name) | Private cloudfront security headers policy name | `string` | `"CustomHeadersPolicy"` | no |
| <a name="input_private_permissions_policy"></a> [private\_permissions\_policy](#input\_private\_permissions\_policy) | Security headers permissions policies | `string` | `"accelerometer=(self), camera=(self), cross-origin-isolated=(self), encrypted-media=(self), geolocation=(self), microphone=(self), interest-cohort=()"` | no |
| <a name="input_private_replication_destination_region"></a> [private\_replication\_destination\_region](#input\_private\_replication\_destination\_region) | Private bucket replica region | `string` | `"us-east-2"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of your project | `string` | `"Terraform-Project"` | no |
| <a name="input_public_access_control_allow_origins"></a> [public\_access\_control\_allow\_origins](#input\_public\_access\_control\_allow\_origins) | Define access control origins | `string` | `"*.test.com"` | no |
| <a name="input_public_access_control_max_age"></a> [public\_access\_control\_max\_age](#input\_public\_access\_control\_max\_age) | Define access control max age for security headers policy | `string` | `"31536000"` | no |
| <a name="input_public_bucket_acceleration"></a> [public\_bucket\_acceleration](#input\_public\_bucket\_acceleration) | Public bucket acceleration option | `string` | `"Suspended"` | no |
| <a name="input_public_bucket_name"></a> [public\_bucket\_name](#input\_public\_bucket\_name) | Name of the public bucket | `string` | `"public-bucket-terraform-1"` | no |
| <a name="input_public_bucket_replication_option"></a> [public\_bucket\_replication\_option](#input\_public\_bucket\_replication\_option) | Public bucket replica Enabled/Disabled | `string` | `"Enabled"` | no |
| <a name="input_public_bucket_versioning"></a> [public\_bucket\_versioning](#input\_public\_bucket\_versioning) | Public bucket versioning Enabled/Disabled | `string` | `"Enabled"` | no |
| <a name="input_public_cidr_block"></a> [public\_cidr\_block](#input\_public\_cidr\_block) | Public subnet CIDR blocks | `list(string)` | <pre>[<br>  "20.0.0.0/20",<br>  "20.0.16.0/20",<br>  "20.0.32.0/20"<br>]</pre> | no |
| <a name="input_public_cloudfront_description"></a> [public\_cloudfront\_description](#input\_public\_cloudfront\_description) | Public CloudFront distribution description | `string` | `"Public CloudFront Distribution"` | no |
| <a name="input_public_content_security_policy"></a> [public\_content\_security\_policy](#input\_public\_content\_security\_policy) | Security headers content security policies | `string` | `"default-src 'none'; img-src 'self'; script-src 'self'; style-src 'self'; object-src 'none'"` | no |
| <a name="input_public_destination_bucket_name"></a> [public\_destination\_bucket\_name](#input\_public\_destination\_bucket\_name) | Public bucket replica bucket name | `string` | `"public-bucket-replica-bucket"` | no |
| <a name="input_public_headers_policy_name"></a> [public\_headers\_policy\_name](#input\_public\_headers\_policy\_name) | Public cloudfront security headers policy name | `string` | `"CustomHeadersPolicy"` | no |
| <a name="input_public_permissions_policy"></a> [public\_permissions\_policy](#input\_public\_permissions\_policy) | Security headers permissions policies | `string` | `"accelerometer=(self), camera=(self), cross-origin-isolated=(self), encrypted-media=(self), geolocation=(self), microphone=(self), interest-cohort=()"` | no |
| <a name="input_public_replication_destination_region"></a> [public\_replication\_destination\_region](#input\_public\_replication\_destination\_region) | Public bucket replica region | `string` | `"us-east-2"` | no |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | Database can be access publicly | `string` | `"false"` | no |
| <a name="input_redis_user_name"></a> [redis\_user\_name](#input\_redis\_user\_name) | Redis database username | `string` | `"redis"` | no |
| <a name="input_redis_user_pwd"></a> [redis\_user\_pwd](#input\_redis\_user\_pwd) | Redis database password | `string` | `"dm3YbhsFqa1P121KEC"` | no |
| <a name="input_repo_default_branch"></a> [repo\_default\_branch](#input\_repo\_default\_branch) | Code commit branch name | `string` | `"main"` | no |
| <a name="input_repository_description"></a> [repository\_description](#input\_repository\_description) | D escription code commit repo | `string` | `"Code Commit Git Repo"` | no |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | Code commit repo name | `string` | `"codecommit-repo"` | no |
| <a name="input_rest_encryption_enabled"></a> [rest\_encryption\_enabled](#input\_rest\_encryption\_enabled) | Enable rest encryption for cluster | `string` | `"true"` | no |
| <a name="input_secretmanager_name"></a> [secretmanager\_name](#input\_secretmanager\_name) | Name of the secret manager | `string` | `"secretmanager"` | no |
| <a name="input_slow_query_log"></a> [slow\_query\_log](#input\_slow\_query\_log) | Database slow log monitoring | `string` | `"1"` | no |
| <a name="input_snapshot_identifier_name"></a> [snapshot\_identifier\_name](#input\_snapshot\_identifier\_name) | Database snapshot name | `string` | `"db-snap"` | no |
| <a name="input_snapshot_retention_limit"></a> [snapshot\_retention\_limit](#input\_snapshot\_retention\_limit) | Number of days for cache cluster snapshots | `string` | `"7"` | no |
| <a name="input_static_access_control_allow_origins"></a> [static\_access\_control\_allow\_origins](#input\_static\_access\_control\_allow\_origins) | Define access control origins | `string` | `"*.test.com"` | no |
| <a name="input_static_access_control_max_age"></a> [static\_access\_control\_max\_age](#input\_static\_access\_control\_max\_age) | Define access control max age for security headers policy | `string` | `"31536000"` | no |
| <a name="input_static_bucket_name"></a> [static\_bucket\_name](#input\_static\_bucket\_name) | S3 bucket name for static webside deployment | `string` | `"static-bucket-terraform-1"` | no |
| <a name="input_static_bucket_versioning"></a> [static\_bucket\_versioning](#input\_static\_bucket\_versioning) | Bucket versioning Enabled/Disabled | `string` | `"Enabled"` | no |
| <a name="input_static_cloudfront_description"></a> [static\_cloudfront\_description](#input\_static\_cloudfront\_description) | Description for CloudFront distribution | `string` | `"Static CloudFront Distribution"` | no |
| <a name="input_static_content_security_policy"></a> [static\_content\_security\_policy](#input\_static\_content\_security\_policy) | Security headers content security policies | `string` | `"default-src 'none'; img-src 'self'; script-src 'self'; style-src 'self'; object-src 'none'"` | no |
| <a name="input_static_headers_policy_name"></a> [static\_headers\_policy\_name](#input\_static\_headers\_policy\_name) | Cloudfront security headers policy name | `string` | `"Static-CDN-HeadersPolicy"` | no |
| <a name="input_static_permissions_policy"></a> [static\_permissions\_policy](#input\_static\_permissions\_policy) | Security headers permissions policies | `string` | `"accelerometer=(self), camera=(self), cross-origin-isolated=(self), encrypted-media=(self), geolocation=(self), microphone=(self), interest-cohort=()"` | no |
| <a name="input_storage_encrypted"></a> [storage\_encrypted](#input\_storage\_encrypted) | Database stotage encryption | `string` | `"true"` | no |
| <a name="input_table_name"></a> [table\_name](#input\_table\_name) | Terrafrom backend dynamoDB table name | `string` | `"terraform-backend-sample-tablename"` | no |
| <a name="input_terraform_bucket_name"></a> [terraform\_bucket\_name](#input\_terraform\_bucket\_name) | Terrafrom backend bucket name | `string` | `"terraform-sample-backend-bucket"` | no |
| <a name="input_terraform_bucket_versioning"></a> [terraform\_bucket\_versioning](#input\_terraform\_bucket\_versioning) | Terrafrom backend bucket versioning Enabled or Disabled | `string` | `"Enabled"` | no |
| <a name="input_tg_name"></a> [tg\_name](#input\_tg\_name) | Name of the target group | `string` | `"default-tg"` | no |
| <a name="input_tg_port"></a> [tg\_port](#input\_tg\_port) | Target group port | `string` | `"80"` | no |
| <a name="input_tg_protocol"></a> [tg\_protocol](#input\_tg\_protocol) | Target group protocol | `string` | `"HTTP"` | no |
| <a name="input_tg_target_type"></a> [tg\_target\_type](#input\_tg\_target\_type) | Target group target type | `string` | `"instance"` | no |
| <a name="input_transit_encryption_enabled"></a> [transit\_encryption\_enabled](#input\_transit\_encryption\_enabled) | Enable transit encryption for cluster | `string` | `"true"` | no |
| <a name="input_version_upgrade"></a> [version\_upgrade](#input\_version\_upgrade) | Cache database version upgrade | `string` | `"false"` | no |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | Main VPC CIDR Block | `string` | `"20.0.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_repo_https_url"></a> [repo\_https\_url](#output\_repo\_https\_url) | Code commit repo clone url |
| <a name="output_repo_name"></a> [repo\_name](#output\_repo\_name) | Code commit repo name |
| <a name="output_repo_password"></a> [repo\_password](#output\_repo\_password) | Code commit repo clone password |
| <a name="output_repo_user_name"></a> [repo\_user\_name](#output\_repo\_user\_name) | Code commit repo clone username |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

-------------------------------

## Terraform Instructions:
To apply this script you have to follow below instructions:

### Step1: Terraform Backend Configuration & Update Variables
```
1. Create a S3 bucket in your selected region.
2. Create DynamoDB table.
3. Configure AWS profile on local with this command
       aws configure --profile projectname

4. Create a terraform.tfvars file from terraform.tfvars.example file.
5. Update the required values in provider.tf file.
6. Update the variable's values in terraform.tfvars files as per your need.
```

##### Note:
1. Refrence links are below.
2. You can select Method 1 by uncommenting it.
-------------------------------

### Step2: To Create All Resources
```
1. terraform init
2. terraform plan -var-file=terraform.tfvars
3. terraform apply -var-file=terraform.tfvars
```
-------------------------------

### To Create Specific Modules/Resources.

```
1. terraform init
2. terraform plan -var-file=terraform.tfvars -target=module.vpc
3. terraform apply -var-file=terraform.tfvars -target=module.vpc
```
-------------------------------

### Step3: To Destroy/Delete All Resources.
```
1. terraform destroy -var-file=terraform.tfvars
```
-------------------------------

### To Destroy/Delete Specific Modules/Resources.
```
terraform destroy -var-file=terraform.tfvars -target=module.vpc
```
## Reference Links:
- [To Create S3 Bucket and DynamoDB Table ](https://www.golinuxcloud.com/configure-s3-bucket-as-terraform-backend/)
- [To Configure AWS Profile ](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)
-------------------------------


#### Terraform Commands:
The available commands for execution are listed below.
The primary workflow commands are given first, followed by less common or more advanced commands
###### Main commands:

```
  init          Prepare your working directory for other commands
  validate      Check whether the configuration is valid
  plan          Show changes required by the current configuration
  apply         Create or update infrastructure
  destroy       Destroy previously-created infrastructure
```
######  All other commands:

```
  console       Try Terraform expressions at an interactive command prompt
  fmt           Reformat your configuration in the standard style
  force-unlock  Release a stuck lock on the current workspace
  get           Install or upgrade remote Terraform modules
  graph         Generate a Graphviz graph of the steps in an operation
  import        Associate existing infrastructure with a Terraform resource
  login         Obtain and save credentials for a remote host
  logout        Remove locally-stored credentials for a remote host
  output        Show output values from your root module
  providers     Show the providers required for this configuration
  refresh       Update the state to match remote systems
  show          Show the current state or a saved plan
  state         Advanced state management
  taint         Mark a resource instance as not fully functional
  test          Experimental support for module integration testing
  untaint       Remove the 'tainted' state from a resource instance
  version       Show the current Terraform version
  workspace     Workspace management
```
###### Global options (use these before the subcommand, if any):
```
 -chdir=DIR    Switch to a different working directory before executing the
                given subcommand.
  -help         Show this help output, or the help for a specified subcommand.
  -version      An alias for the "version" subcommand.

```
-------------------------------

Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. Terraform can manage existing and popular service providers as well as custom in-house solutions.

The key features of Terraform are:

- **Infrastructure as Code**: Infrastructure is described using a high-level configuration syntax. This allows a blueprint of your datacenter to be versioned and treated as you would any other code. Additionally, infrastructure can be shared and re-used.

- **Execution Plans**: Terraform has a "planning" step where it generates an *execution plan*. The execution plan shows what Terraform will do when you call apply. This lets you avoid any surprises when Terraform manipulates infrastructure.

- **Resource Graph**: Terraform builds a graph of all your resources, and parallelizes the creation and modification of any non-dependent resources. Because of this, Terraform builds infrastructure as efficiently as possible, and operators get insight into dependencies in their infrastructure.

- **Change Automation**: Complex changesets can be applied to your infrastructure with minimal human interaction. With the previously mentioned execution plan and resource graph, you know exactly what Terraform will change and in what order, avoiding many possible human errors.

For more information, see the [introduction section](https://www.terraform.io/intro) of the Terraform website.

Getting Started & Documentation
-------------------------------
Documentation is available on the [Terraform website](https://www.terraform.io):
  - [Intro](https://www.terraform.io/intro/index.html)
  - [Docs](https://www.terraform.io/docs/index.html)

If you're new to Terraform and want to get started creating infrastructure, please check out our [Getting Started guides](https://learn.hashicorp.com/terraform#getting-started) on HashiCorp's learning platform. There are also [additional guides](https://learn.hashicorp.com/terraform#operations-and-development) to continue your learning.

Show off your Terraform knowledge by passing a certification exam. Visit the [certification page](https://www.hashicorp.com/certification/) for information about exams and find [study materials](https://learn.hashicorp.com/terraform/certification/terraform-associate) on HashiCorp's learning platform.

Developing Terraform
--------------------

This repository contains only Terraform core, which includes the command line interface and the main graph engine. Providers are implemented as plugins, and Terraform can automatically download providers that are published on [the Terraform Registry](https://registry.terraform.io). HashiCorp develops some providers, and others are developed by other organizations. For more information, see [Extending Terraform](https://www.terraform.io/docs/extend/index.html).

To learn more about compiling Terraform and contributing suggested changes, please refer to [the contributing guide](.github/CONTRIBUTING.md).

To learn more about how we handle bug reports, please read the [bug triage guide](./BUGPROCESS.md).

-------------------------------

## License
<p align="center">
<a href="https://www.codiant.com/"><img src="https://www.codiant.com/assets/images/codiant-logo.svg" width="400"></a>
</p>
