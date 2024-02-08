#------------------ CODEBUILD SERVICE ROLE POLICY ---------------------------------
resource "aws_iam_role_policy" "codebuild-role-policy" {
  count  = var.create_codebuild_dev-backend-apprunner == true ? 1 : 0
  name   = var.crossac-codebuild-service-role-policy_name
  role   = aws_iam_role.codebuild-service-role[0].name
  policy = file("${path.module}/templates/codebuild_role_policy.json")
}

#------------------ CODEBUILD INSTANCE ROLE POLICY ---------------------------------
resource "aws_iam_role_policy" "codebuildinstance-role-policy" {
  count  = var.create_codebuild_dev-backend-apprunner == true ? 1 : 0
  name   = var.crossac-codebuildinstance-role-policy_name
  role   = aws_iam_role.codebuildinstancerole[0].name
  policy = file("${path.module}/templates/codebuild_instance-role-policy.json")
}


#------------------ CODE PIPELINE SERVICE ROLE POLICY ---------------------------------

resource "aws_iam_role_policy" "codepipeline_role_policy" {
  count  = var.create_codepipeline_role_policy == true ? 1 : 0
  name   = var.crossac-codepipeline_role_policy_name
  role   = aws_iam_role.codepipeline_role[0].id
  policy = file("${path.module}/templates/codepipeline_role_policy.json")
}

