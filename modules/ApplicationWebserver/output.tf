output "application_instance_eip" {
  description = "Application instance Public IP address"
  value       = aws_eip.application_eip.public_ip
}