data "aws_ami" "instance_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.instance_ami.id
  instance_type = var.instance_type
  root_block_device {
    volume_type = var.ebs_volume_type
    volume_size = var.ebs_volume_size
    delete_on_termination = true
  }
#   key_name = "" # Key Setup Pending
#   security_groups = "" # Security Group Pending
#   enclave_options = false 
  
  tags = {
    Name = "${var.project_name}-${var.env_suffix}"
  }
}