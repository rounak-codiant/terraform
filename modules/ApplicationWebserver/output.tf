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