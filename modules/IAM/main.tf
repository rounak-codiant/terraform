
# Create IAM User Policy
resource "aws_iam_user_policy" "s3_limited_access" {
  name = "S3-Access-Policy"
  user = aws_iam_user.s3_user.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:PutObjectAcl",
        "s3:DeleteObject"
      ],
      "Effect": "Allow",
      "Resource": [
         "${var.private_bucket_arn}/*",
         "${var.public_bucket_arn}/*"
      ]
    }
  ]
}
EOF
}

# Create a IAM User
resource "aws_iam_user" "s3_user" {
  name = var.s3_iam_user_name
  path = "/"

  tags = {
    Name        = "${var.project_name}-User"
    Environment = "${var.env_suffix}"
  }
}

# Create IAM User Secret Keys
resource "aws_iam_access_key" "s3_user_access" {
  user = aws_iam_user.s3_user.name
  # pgp_key = "keybase:s3access"
  # pgp_key = var.pgp_key
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
        "secretsmanager:GetSecretValue",
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
    }
  ]
}
EOF
  tags = {
    Name        = "${var.project_name}-EC2-Policy"
    Environment = "${var.env_suffix}"
  }
}

# Create IAM Role Foe EC2 
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

#IAM instance profile 
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "EC2_Profile"
  role = aws_iam_role.ec2_s3_sm_access_role.name
}


# resource "aws_iam_access_key" "s3_user_access" {
#   user    = aws_iam_user.s3_user.name
#   pgp_key = "keybase:staticuser"
# }
