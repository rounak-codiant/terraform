output "waf_acl_arn" {
  description = "AWS WAF ACl ARN"
  value       = aws_wafv2_web_acl.web_acl.arn
}
