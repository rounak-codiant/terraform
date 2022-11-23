
# Fetch AMI
data "aws_ami" "instance_ami" {
  most_recent = true

  # filter {
  #   name   = "name"
  #   values = ["ubuntu/images/hvm-ssd*-amd64*"]
  # }

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal*-amd64*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# Create Security Group For EC2
resource "aws_security_group" "application_sg" {
  name        = "Application-SG"
  description = "Application - Security Group"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP Traffic"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTPS Traffic"
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "DB Traffic"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["103.231.46.102/32"]
    description = "SSH Traffic"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Application-SG"
  }
}

# Create EIP For EC2
resource "aws_eip" "application_eip" {
  tags = {
    Name        = "${var.project_name}-EIP"
    Environment = "${var.env_suffix}"
  }
}

# Create OpenSSH Key
resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create SSH Key with the help of OpenSSH Key
resource "aws_key_pair" "keypair" {
  key_name   = var.key_pair_name
  public_key = tls_private_key.key.public_key_openssh

  provisioner "local-exec" {
    command = "echo '${tls_private_key.key.private_key_pem}' > ./pemkey.pem" // change value as key_pair_name
  }
}

# Create EC2 instance
resource "aws_instance" "web" {
  # ami           = "ami-0fdb3f3ff5d7c40db"
  ami                    = data.aws_ami.instance_ami.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.keypair.key_name
  vpc_security_group_ids = ["${aws_security_group.application_sg.id}"]
  iam_instance_profile   = var.iam_instance_profile
  root_block_device {
    volume_type           = var.ebs_volume_type
    volume_size           = var.ebs_volume_size
    delete_on_termination = true
  }

  tags = {
    Name        = "${var.project_name}-EC2"
    Environment = "${var.env_suffix}"
  }

  depends_on = [
    aws_security_group.application_sg,
    aws_key_pair.keypair
  ]
}

# Attach EIP to EC2 Instance
resource "aws_eip_association" "application_eip_assoc" {
  instance_id   = aws_instance.web.id
  allocation_id = aws_eip.application_eip.id

  depends_on = [
    aws_instance.web,
    aws_eip.application_eip
  ]
}