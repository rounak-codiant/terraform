
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
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "HTTP Traffic"
  }

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "HTTPS Traffic"
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
    command = "echo '${tls_private_key.key.private_key_pem}' > ./${var.key_pair_name}.pem"
  }
  tags = {
    Name        = "${var.project_name}-Key"
    Environment = "${var.env_suffix}"
  }
}


# Create IAM Policy For EC2 Role
resource "aws_iam_policy" "ec2_policy" {
  name        = var.ec2_policy_name
  description = "S3 SM and CloudWatch Access Policy For EC2"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:PutObjectAcl",
        "s3:DeleteObject",
        "logs:PutRetentionPolicy",
        "secretsmanager:ListSecrets",
        "ec2:DescribeVolumes",
        "ec2:DescribeTags",
        "cloudwatch:PutMetricData",
        "logs:PutLogEvents",
        "logs:DescribeLogStreams",
        "logs:DescribeLogGroups",
        "logs:CreateLogStream",
        "logs:CreateLogGroup"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": "secretsmanager:GetSecretValue",
      "Resource": "*"
    }
  ]
}
EOF
  tags = {
    Name        = "${var.project_name}-EC2-Policy"
    Environment = "${var.env_suffix}"
  }
}


# Create IAM Role For EC2 
resource "aws_iam_role" "ec2_s3_sm_access_role" {
  name = var.ec2_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
  tags = {
    Name        = "${var.project_name}-EC2-Role"
    Environment = "${var.env_suffix}"
  }
}

# Attached IAM Policy to IAM Role 
resource "aws_iam_policy_attachment" "ec2_policy_attached" {
  name       = "ec2_policy_attachment"
  roles      = ["${aws_iam_role.ec2_s3_sm_access_role.name}"]
  policy_arn = aws_iam_policy.ec2_policy.arn
}

# Create IAM instance profile 
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "EC2_Profile"
  role = aws_iam_role.ec2_s3_sm_access_role.name
}


# Create EC2 instance
resource "aws_instance" "web" {
  # ami           = "ami-0fdb3f3ff5d7c40db"
  ami                    = data.aws_ami.instance_ami.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.keypair.key_name
  vpc_security_group_ids = ["${aws_security_group.application_sg.id}"]
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name
  monitoring             = var.ec2_monitoring
  subnet_id              = var.ec2_subnet_id
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