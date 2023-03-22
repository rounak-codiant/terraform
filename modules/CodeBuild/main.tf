resource "aws_s3_bucket" "codebuild_bucket" {
  bucket        = var.codebuild_bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_acl" "codebuild_bucket_acl" {
  bucket = aws_s3_bucket.codebuild_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "codebuild_bucket_versioning" {
  bucket = aws_s3_bucket.codebuild_bucket.id
  versioning_configuration {
    status = var.codebuild_bucket_versioning
  }
}

resource "aws_s3_bucket_public_access_block" "access_block" {
  bucket                  = aws_s3_bucket.codebuild_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "code_build" {
  name               = var.codebuild_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "codebuild" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "codecommit:GitPull"
    ]

    resources = [
      var.codecommit_arn
    ]
  }
  statement {
    effect = "Allow"

    actions = [
      "codebuild:CreateReportGroup",
      "codebuild:CreateReport",
      "codebuild:UpdateReport",
      "codebuild:BatchPutTestCases",
      "codebuild:BatchPutCodeCoverages"
    ]

    resources = ["*"]
  }
  statement {
    effect = "Allow"
    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:GetBucketAcl",
      "s3:GetBucketLocation",
    ]
    resources = [
      aws_s3_bucket.codebuild_bucket.arn,
      "${aws_s3_bucket.codebuild_bucket.arn}/*",
    ]
  }
}

resource "aws_iam_role_policy" "codebuild" {
  role   = aws_iam_role.code_build.name
  policy = data.aws_iam_policy_document.codebuild.json
}

resource "aws_codebuild_project" "codebuild_project" {
  name          = var.codebuild_project_name
  description   = var.codebuild_project_description
  build_timeout = var.build_timeout
  service_role  = aws_iam_role.code_build.arn

  artifacts {
    type      = "S3"
    location  = aws_s3_bucket.codebuild_bucket.bucket
    packaging = "ZIP"
  }

  cache {
    type = "NO_CACHE"
  }

  environment {
    compute_type                = var.codebuild_compute_type
    image                       = var.codebuild_image
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"

    # environment_variable {
    #   name  = "SOME_KEY1"
    #   value = "SOME_VALUE1"
    # }
  }

  logs_config {
    cloudwatch_logs {
      group_name  = var.codebuild_project_name
      stream_name = "logs"
    }
  }

  source {
    type            = "CODECOMMIT"
    location        = var.repo_name
    git_clone_depth = 1
  }

  source_version = var.codebuild_source_branch

  tags = {
    Name        = "${var.project_name}-codebuild-project"
    Environment = "${var.env_suffix}"
  }
}