output "application_instance_eip" {
  description = "Application instance Public IP address"
  value       = aws_eip.application_eip.public_ip
}

output "application_sg_id" {
  description = "Application security group id"
  value       = aws_security_group.application_sg.id
}

output "web_instance_id" {
  value = aws_instance.web.id
}

output "ec2_private_key" {
  value     = tls_private_key.key.private_key_pem
  sensitive = true
}


output "ec2_role_arn" {
  value = aws_iam_role.ec2_s3_sm_access_role.arn
}