
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
        "s3:PutObject"
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
    Name        = "${var.project_name}-${var.s3_iam_user_name}"
    Environment = "${var.env_suffix}"
  }
}

# Create IAM User Secret Keys
resource "aws_iam_access_key" "s3_user_access" {
  user = aws_iam_user.s3_user.name
  # pgp_key = "keybase:s3access"
  # pgp_key = var.pgp_key
}
