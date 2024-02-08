#------------ REGION ------------------------
variable "region" {
  default = "us-east-1"
}
# ------------ RESOURCE PREFIX ------------------------
variable "prefix" {
  default = "crossac"
}

#---------------------- CODEBUILD PROJECT ----------------------------------
variable "project_names_dev-test-backend" {
  type = string
  default = "crossacproject"
}
variable "build_timeout" {
  type = string
  default = "value"
}

variable "compute_type" {
  type    = string
  default = "BUILD_GENERAL1_SMALL"
}

variable "crossac-codepipelin_service_role_name" {
  type    = string
  default = "crossac-codepipelin_service_role_name"
  
}
variable "codebuild_image" {
  type    = string
  default = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
}

variable "container_type" {
  type    = string
  default = "LINUX_CONTAINER"

}

variable "privileged_mode" {
  type    = bool
  default = true
}

variable "source_type" {
  type    = string
  default = "CODECOMMIT"
}


variable "crossac-codebuildinstancerole_name" {
  type    = string
  default = "crossac-codebuildinstancerole"

}

#------------------ CODEBUILD PROJECT FOR DEV FRONTEND SERVICE ---------------------------------
variable "create_codebuild_dev-frontend-apprunner" {
  type    = bool
  default = true
}

variable "project_names_dev-frontend" {
  type    = string
  default = "dev-frontend-project"
}

variable "ref_dev-frontend-apprunner" {
  type    = string
  default = "refs/heads/dev-frontend-apprunner"
}

variable "codebuild_fe_tag" {
  type    = string
  default = "dev-frontend-project"
}

#------------------ CODEBUILD PROJECT SERVICE ROLE -------------------------------------------
variable "create_codebuild-service-role" {
  type    = bool
  default = true
}
variable "crossac-codebuild-service-role_name" {
  type    = string
  default = "crossac-codebuild-service-role"
}


#------------------ CODEBUILD PROJECT FOR DEV BACKEND SERVICE ---------------------------------
variable "create_codebuild_dev-backend-apprunner" {
  type    = bool
  default = true
}

variable "crossac-codebuild-service-role-policy_name" {
  type    = string
  default = "crossac-codebuild-service-role-policy"
}

variable "crossac-codebuildinstance-role-policy_name" {
  type    = string
  default = "crossac-codebuildinstance-role-policy"
}

variable "dev_backend_codebuild_description" {
  type    = string
  default = "CodeBuild project for CICD"
}

variable "dev_frontend_codebuild_description" {
  type    = string
  default = "CodeBuild project for Dev Frontend Service"
}

variable "project_names_dev-backend" {
  type    = string
  default = "dev-backend-project"
}
variable "ref_dev-backend-apprunner" {
  type    = string
  default = "refs/heads/dev-backend-apprunner"
}

variable "codebuild_be_tag" {
  type    = string
  default = "dev-backend-project"
}


#----------------------------TEST-CASE DEV BACKENDSERVICE ----------------------------------------------

variable "create_codebuild_dev-test" {
  type    = bool
  default = true

}
variable "project_names_dev-test" {
  type    = string
  default = "dev-test-backend"
}
variable "ref_branch-name" {
  type    = string
  default = "refs/heads/master"
}

variable "project_names_test_manual_approval" {
  type    = string
  default = "crossac-manual-approval-backend"

}

variable "create_codebuild_dev-test-backend-apprunner" {
  type    = bool
  default = true
}


#---------------- CODEPIPELINE SERVICE ROLE & POLICY--------------------------------
variable "create_codepipeline_role" {
  type    = bool
  default = true

}
variable "cross-codepipelin_service_role_name" {
  type    = string
  default = "crossac-codepipelin_service_role"
}

variable "create_codepipeline_role_policy" {
  type    = bool
  default = true

}

variable "crossac-codepipeline_role_policy_name" {
  type    = string
  default = "crossac-codepipeline_role_policy"
}

# ----------------------CODEPIPELINE BACKEND ---------------------------------------------------
variable "create_codepipeline_be" {
  type    = bool
  default = true
}
variable "create_s3_codepipeline_be" {
  type    = bool
  default = true
}
variable "codepipeline_be_name" {
  type    = string
  default = "dev-backend-pipeline"
}
variable "artifact_store_type_be" {
  type    = string
  default = "S3"
}
variable "encryption_key_be" {
  type    = string
  default = "KMS"
}
variable "repo_name_be" {
  type    = string
  default = "crossacecr"
}
variable "branch_be" {
  type    = string
  default = "dev-backend-apprunner"
}
variable "cp_bucket_be" {
  type    = string
  default = "dev-backend-pipelinebucket-21112023"
}
variable "force_destroy_s3" {
  type    = bool
  default = true
}
variable "s3kmskey_be" {
  type    = string
  default = "alias/aws/s3"
}

#-------------------------cp test-case------------------------------------
variable "create_codepipeline_be-test" {
  type    = bool
  default = true
}
variable "codepipeline_be-test_name" {
  type    = string
  default = "crossac-devops-test-case"
}
variable "repo_name_be_test" {
  type    = string
  default = "crossac-Infra"
}
variable "branch_be-test" {
  type    = string
  default = "master"
}
variable "create_s3_codepipeline_be-test" {
  type    = bool
  default = true
}
variable "cp_bucket_be-test" {
  type    = string
  default = "crossac-dev-backend-test-pipelinebucket-21112023"
}
variable "s3kmskey_be-test" {
  type    = string
  default = "alias/aws/s3"
}
