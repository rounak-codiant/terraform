
variable "headers_policy_name" {
  description = "Define cloudfront security headers policy name"
}

variable "s3_bucket_domain_name" {
  description = "Domain of the S3 bucket "
}

variable "s3_bucket_id" {
  description = "ID of the S3 bucket"
}

variable "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
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
  description = "Security headers permissions policies"
}

variable "access_control_allow_origins" {
  description = "Define access control origins"
}

variable "content_security_policy" {
  description = "Security headers content security policies"
}

variable "access_control_max_age" {
  description = "Define access control max age for security headers policy"
}
