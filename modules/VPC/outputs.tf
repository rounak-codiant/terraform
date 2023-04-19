output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet" {
  value = aws_subnet.public_subnet.*.id
}

output "ec2_public_subnet" {
  value = flatten(aws_subnet.public_subnet.*.id)[0]

}

output "private_subnet" {
  value = aws_subnet.private_subnet.*.id
}

output "available_zones" {
  value = data.aws_availability_zones.available[*].names
}
