
resource "aws_iam_role_policy" "ecr_policy" {
  count = var.create_ecr_policy == true ? 1 : 0
  name  = var.ecr_policy_name
  role  = aws_iam_role.app_runner_build_role[0].id

  # Permissions to pull images from ECR
  policy = file("${path.module}/${var.env}/ecr_policy.json")

}

