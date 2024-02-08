#---------------- ECR FOR BACKEND SERVICE -------------------------------------
resource "aws_ecr_repository" "backend_repo" {
  count                = var.create_ecr_be == true ? 1 : 0
  name                 = var.backend_repo_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  force_delete = var.force_delete_value
  tags = {
    project = "Cross Account Infra Provisioning Pipeline"

    Name    = "${var.prefix}-${var.ecr_name_be}"
  }
}

resource "aws_ecr_repository_policy" "ecr-policy" {
  repository = aws_ecr_repository.backend_repo[0].name
  policy     = data.aws_iam_policy_document.ecrpolicy.json
}



#--------------Datablock-----------------------------------------
data "aws_iam_policy_document" "ecrpolicy" {

  statement {
    sid    = "AllowPushPull"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::DEV-ACCOUNT-ID:root"]
    }

    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:BatchGetImage",
      "ecr:CompleteLayerUpload",
      "ecr:GetDownloadUrlForLayer",
      "ecr:InitiateLayerUpload",
      "ecr:PutImage",
      "ecr:UploadLayerPart"
    ]
  }
}
