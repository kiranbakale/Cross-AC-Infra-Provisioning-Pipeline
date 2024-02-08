resource "aws_codepipeline" "codepipeline_be-test" {
  count      = var.create_codepipeline_be-test == true ? 1 : 0
  name       = var.codepipeline_be-test_name
  role_arn   = aws_iam_role.codepipeline_role[0].arn
  depends_on = [aws_codebuild_project.test-manual_approval]
  artifact_store {
    location = aws_s3_bucket.codepipeline_bucket_be-test[0].bucket
    type     = var.artifact_store_type_be

    encryption_key {
      id   = data.aws_kms_alias.s3kmskey.arn
      type = var.encryption_key_be
    }
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeCommit"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        RepositoryName       = var.repo_name_be_test
        BranchName           = var.branch_be-test
        PollForSourceChanges = true

      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      version          = "1"

      configuration = {
        ProjectName = aws_codebuild_project.test-backend[0].name
      }
    }
  }

  stage {
    name = "ManualApproval"

    action {
      name     = "ManualApproval"
      category = "Approval"
      owner    = "AWS"
      provider = "Manual"
      version  = "1"
    }
}

stage {
  name = "TF_APPLY"
  action {
    name            = "TF_APPLY"
    category         = "Build"
    owner            = "AWS"
    provider         = "CodeBuild"
    input_artifacts  = ["source_output"]
    output_artifacts = ["build_output_apply_artifacts"]
    version          = "1"
    
    configuration = {
        ProjectName = aws_codebuild_project.test-manual_approval[0].name
      }
    }
  }

  tags = {
    project = "Cross Account Infra Provisioning Pipeline"

  }
}


resource "aws_s3_bucket" "codepipeline_bucket_be-test" {
  count         = var.create_s3_codepipeline_be-test == true ? 1 : 0
  bucket        = var.cp_bucket_be-test
  force_destroy = var.force_destroy_s3
  tags = {
    project = "Cross Account Infra Provisioning Pipeline"

  }
}

data "aws_kms_alias" "s3kmskey" {
  name = var.s3kmskey_be-test
}


