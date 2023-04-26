# Create AWS CodeCommit git repo
resource "aws_codecommit_repository" "repo" {
  repository_name = var.repository_name
  description     = var.repository_description
  default_branch  = var.repo_default_branch
  tags = {
    Name        = "${var.project_name}-repo"
    Environment = "${var.env_suffix}"
  }
}

## Create IAM user for codecommit
resource "aws_iam_user" "codecommit" {
  name          = var.codecommit_user_name
  force_destroy = var.iam_force_destroy
}

## Attach policy to user
resource "aws_iam_user_policy_attachment" "policy_attach" {
  user       = aws_iam_user.codecommit.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeCommitPowerUser"
}

## Create Git Credential
resource "aws_iam_service_specific_credential" "codecommit_cred" {
  service_name = "codecommit.amazonaws.com"
  user_name    = aws_iam_user.codecommit.name
}
