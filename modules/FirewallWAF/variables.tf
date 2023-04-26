variable "env_suffix" {
  description = "Define project environment"
}

variable "waf_acl_name" {
  description = "Name of the waf acl"
}

variable "waf_acl_description" {
  description = "WAF acl description"
}

variable "waf_acl_scope" {
  description = "waf acl scope (REGIONAL/CLOUDFRONT)"
  # REGIONAL: For ALB
  # CLOUDFRONT: For ClodFront distribution
}
