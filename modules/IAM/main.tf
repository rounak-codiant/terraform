resource "aws_iam_user" "s3_user" {
  name = "s3-user"
  path = "/"
}

resource "aws_iam_access_key" "s3_user_access" {
  user    = aws_iam_user.s3_user.name
  pgp_key = "keybase:staticuser"
}

resource "aws_iam_user_policy" "s3_limited_access" {
  name = "S3Limited-Access"
  user = aws_iam_user.s3_user.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:PutObject",
        "s3:GetObject",
        "s3:DeleteObject"
      ],
      "Effect": "Allow",
      "Resource": [
         "${var.sm_public_bucket}",
         "${var.sm_private_bucket}"
      ]
    }
  ]
}
EOF
}