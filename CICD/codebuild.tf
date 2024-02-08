resource "aws_codebuild_project" "test-backend" {
  depends_on     = [aws_iam_role.codebuildinstancerole]
  count          = var.create_codebuild_dev-test-backend-apprunner == true ? 1 : 0
  name           = var.project_names_dev-test-backend
  description    = var.dev_backend_codebuild_description
  build_timeout  = var.build_timeout
  service_role   = aws_iam_role.codebuild-service-role[0].arn
  source_version = var.ref_branch-name # branch name to fetch code from codecommit 

  artifacts {
    type     = "S3"
    location = "your-artifacts-bucket-name"
  }

  environment {
    compute_type    = var.compute_type
    image           = var.codebuild_image
    type            = var.container_type
    privileged_mode = var.privileged_mode

    environment_variable {
      name  = "ASSUME_ROLE_ARN"
      value = "arn:aws:iam::DEV-ACCOUNT-ID:role/crossac-codebuildinstancerole"
    }

    environment_variable {
      name  = "UAT_ROLE_ARN"
      value = "PASTE THE UAT ACCOUNT ROLE HERE"
    }
    
    environment_variable {
      name  = "PROD_ROLE_ARN"
      value = "PASTE THE PROD ACCOUNT ROLE HERE"
    }

  }

  source {
    type     = var.source_type
    location = data.aws_codecommit_repository.cross-account-infra-repo.id
    #buildspec = file("${path.module}/templates/buildspec.yml")
  }

  tags = {
    Name    = "${var.prefix}-${var.codebuild_be_tag}"
    project = "Cross Account Infra Provisioning Pipeline"
  }
}

resource "aws_s3_bucket" "test-artifacts-bucket" {
  bucket = "your-artifacts-bucket-name"
}


#------------------ CODEBUILD PROJECT FOR MANUAL-APPROVAL ---------------------------------
resource "aws_codebuild_project" "test-manual_approval" {
  depends_on     = [aws_iam_role.codebuildinstancerole, aws_codebuild_project.test-backend]
  count          = var.create_codebuild_dev-test-backend-apprunner == true ? 1 : 0
  name           = var.project_names_test_manual_approval
  description    = var.dev_backend_codebuild_description
  build_timeout  = var.build_timeout
  service_role   = aws_iam_role.codebuild-service-role[0].arn
  source_version = var.ref_branch-name  # branch name to fetch code from


  artifacts {
    type = "NO_ARTIFACTS"
  }


  environment {
    compute_type    = var.compute_type
    image           = var.codebuild_image
    type            = var.container_type
    privileged_mode = var.privileged_mode

    environment_variable {
      name  = "ASSUME_ROLE_ARN"
      value = "arn:aws:iam::DEV-ACCOUNT-ID:role/crossac-codebuildinstancerole"
    }

    
    environment_variable {
      name  = "UAT_ROLE_ARN"
      value = "PASTE THE UAT ACCOUNT ROLE HERE"
    }
    
    environment_variable {
      name  = "PROD_ROLE_ARN"
      value = "PASTE THE PROD ACCOUNT ROLE HERE"
    }

  }

  source {
    type      = var.source_type
    location  = data.aws_codecommit_repository.cross-account-infra-repo.id
    buildspec = file("${path.module}/templates/buildspec-tf-apply.yml")
  }

  tags = {
    Name    = "${var.prefix}"
    project = "Cross Account Infra Provisioning Pipeline"

  }
}
