# Create a CodeDeploy application
resource "aws_codedeploy_app" "main" {
  name = var.codedeploy_app_name
  tags = {
    Name        = "${var.project_name}-CodeDeploy-App"
    Environment = "${var.env_suffix}"
  }
}

# Create a Service role for codedeploy
resource "aws_iam_role" "codedeploy_service" {
  name = var.codedeploy_service_role_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "codedeploy.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}


resource "aws_iam_role_policy_attachment" "codedeploy_service" {
  role       = aws_iam_role.codedeploy_service.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
}

# Create a Deployment Group
resource "aws_codedeploy_deployment_group" "main" {
  app_name              = aws_codedeploy_app.main.name
  deployment_group_name = var.deployment_group_name
  service_role_arn      = aws_iam_role.codedeploy_service.arn

  deployment_config_name = "CodeDeployDefault.OneAtATime"

  deployment_style {
    deployment_option = "WITH_TRAFFIC_CONTROL"
    deployment_type   = "BLUE_GREEN"
  }

  load_balancer_info {
    target_group_info {
      name = var.target_group_name
    }
  }

  blue_green_deployment_config {
    deployment_ready_option {
      action_on_timeout = "CONTINUE_DEPLOYMENT"
    }

    green_fleet_provisioning_option {
      action = "DISCOVER_EXISTING"
    }

    terminate_blue_instances_on_deployment_success {
      action                           = "TERMINATE"
      termination_wait_time_in_minutes = var.instances_terminate_time
    }
  }

  auto_rollback_configuration {
    enabled = true
    events = [
      "DEPLOYMENT_FAILURE",
    ]
  }
  tags = {
    Name        = "${var.project_name}-Deployment-Group"
    Environment = "${var.env_suffix}"
  }
}
