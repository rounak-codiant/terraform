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


resource "aws_security_group" "application_sg" {
  name        = "Application_SG"
  description = "Application - Security Group"
  # vpc_id      = aws_vpc.main.id

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

resource "aws_instance" "web" {
  ami           = data.aws_ami.instance_ami.id
  instance_type = var.instance_type
  root_block_device {
    volume_type = var.ebs_volume_type
    volume_size = var.ebs_volume_size
    delete_on_termination = true
  }
  key_name = var.key_pair_location # Key Setup Pending
#   security_groups = "" # Security Group Pending
#   enclave_options = false
  
  tags = {
    Name        = "${var.project_name}"
    Environment = "${var.env_suffix}"
  }
}