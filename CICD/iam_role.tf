#------------------ CODEBUILD SERVICE ROLE ---------------------------------
resource "aws_iam_role" "codebuild-service-role" {
  count = var.create_codebuild-service-role == true ? 1 : 0
  name  = var.crossac-codebuild-service-role_name

  assume_role_policy = file("${path.module}/templates/codebuild-service-role-policy.json")

  tags = {
    project = "Cross Account Infra Provisioning Pipeline"

  }
}

#------------------ CODEBUILD INSTANCE ROLE ---------------------------------
resource "aws_iam_role" "codebuildinstancerole" {
  depends_on         = [aws_iam_role.codebuild-service-role]
  count              = var.create_codebuild-service-role == true ? 1 : 0
  name               = var.crossac-codebuildinstancerole_name
  assume_role_policy = file("${path.module}/templates/codebuild_instance-service-role-policy.json")

  tags = {
    project = "Cross Account Infra Provisioning Pipeline"

  }
}

#------------------ CODE PIPELINE SERVICE ROLE ---------------------------------
resource "aws_iam_role" "codepipeline_role" {
  count              = var.create_codepipeline_role == true ? 1 : 0
  name               = var.crossac-codepipelin_service_role_name
  assume_role_policy = file("${path.module}/templates/codepipeline_servicerole_policy.json")

  tags = {
    project = "Cross Account Infra Provisioning Pipeline"

  }
}
