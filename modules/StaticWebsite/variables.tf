variable "env_suffix" {
  description = "Define project environment"
}

variable "static_bucket_name" {
  description = "Define s3 bucket name for static webside deployment"
}

variable "static_bucket_versioning" {
  description = "Define s3 bucket versioning option"
}

variable "headers_policy_name" {
  description = "Define cloudfront security headers policy name"
}

variable "default_root_object" {
  description = "Object that you want CloudFront to return (for example, index.html) when an end user requests the root URL"
}

variable "objects_compress" {
  description = "CloudFront automatically compress objects option"
}

variable "ipv6_enabled" {
  description = "Whether the IPv6 is enabled for the distribution"
}

variable "http_version" {
  description = "HTTP version to support the distribution"
}

variable "cloudfront_description" {
  description = "Define description CloudFront distribution"
}

variable "permissions_policy" {
  description = "Cloudfront permissions policies"
}

variable "access_control_allow_origins" {
  description = "Define access control origins"
}

variable "content_security_policy" {
  description = "Define content security policies for security headers policy"
}

variable "access_control_max_age" {
  description = "Define access control max age for security headers policy"
}

variable "waf_acl_id" {
  description = "To attach AWS WAF acl"
}
