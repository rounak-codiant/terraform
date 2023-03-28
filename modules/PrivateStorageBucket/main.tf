provider "aws" {
  alias   = "dest_region"
  profile = var.private_aws_profile_name
  region  = var.private_replication_destination_region
}

resource "aws_s3_bucket" "private_bucket" {
  bucket        = var.private_bucket_name
  force_destroy = true
  # acceleration_status = var.private_bucket_acceleration

  tags = {
    Name        = "${var.private_bucket_name}"
    Environment = "${var.env_suffix}"
  }
}

resource "aws_s3_bucket_acl" "private_bucket_acl" {
  bucket = aws_s3_bucket.private_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "private_bucket_versioning" {
  bucket = aws_s3_bucket.private_bucket.id
  versioning_configuration {
    status = var.private_bucket_versioning
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "private_bucket_encryption" {
  bucket = aws_s3_bucket.private_bucket.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket                  = aws_s3_bucket.private_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

data "aws_kms_key" "kms_key_arn" {
  provider = aws.dest_region
  key_id   = "alias/aws/s3"
}

resource "aws_iam_role" "replication" {
  name               = var.private_replication_role_name
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}

resource "aws_iam_policy" "replication" {
  name = var.private_replication_policy_name

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetReplicationConfiguration",
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": [
        "${aws_s3_bucket.private_bucket.arn}"
      ]
    },
    {
      "Action": [
        "s3:GetObjectVersionForReplication",
        "s3:GetObjectVersionAcl",
         "s3:GetObjectVersionTagging"
      ],
      "Effect": "Allow",
      "Resource": [
        "${aws_s3_bucket.private_bucket.arn}/*"
      ]
    },
    {
      "Action": [
        "s3:ReplicateObject",
        "s3:ReplicateDelete",
        "s3:ReplicateTags"
      ],
      "Effect": "Allow",
      "Resource": "${aws_s3_bucket.destination.arn}/*"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "replication" {
  role       = aws_iam_role.replication.name
  policy_arn = aws_iam_policy.replication.arn
}

resource "aws_s3_bucket" "destination" {
  provider      = aws.dest_region
  bucket        = var.private_destination_bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_acl" "destination_bucket_acl" {
  provider = aws.dest_region
  bucket   = aws_s3_bucket.destination.id
  acl      = "private"
}

resource "aws_s3_bucket_versioning" "destination" {
  provider = aws.dest_region
  bucket   = aws_s3_bucket.destination.id
  versioning_configuration {
    status = var.private_bucket_versioning
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "destination_bucket_encryption" {
  provider = aws.dest_region
  bucket   = aws_s3_bucket.destination.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "destination_access_block" {
  provider                = aws.dest_region
  bucket                  = aws_s3_bucket.destination.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_replication_configuration" "replication" {
  # Must have bucket versioning enabled first
  depends_on = [aws_s3_bucket_versioning.private_bucket_versioning]
  role       = aws_iam_role.replication.arn
  bucket     = aws_s3_bucket.private_bucket.id

  rule {
    id     = var.private_bucket_replica_rule_name
    status = var.private_bucket_replication_option
    filter {
      prefix = ""
    }
    delete_marker_replication {
      status = "Enabled"
    }
    source_selection_criteria {
      sse_kms_encrypted_objects {
        status = "Enabled"
      }
    }

    destination {
      bucket = aws_s3_bucket.destination.arn
      encryption_configuration {
        replica_kms_key_id = data.aws_kms_key.kms_key_arn.arn
      }
    }
  }
}
