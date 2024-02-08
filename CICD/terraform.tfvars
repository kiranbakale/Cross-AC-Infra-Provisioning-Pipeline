#------------ REGION ------------------------
region = "us-east-1"

# ------------ RESOURCE PREFIX ------------------------
prefix = "crossac"

#----------------------- COMMAN CODEBUILD PROJECT SETTINGS ----------------------------------
build_timeout   = "15"
compute_type    = "BUILD_GENERAL1_SMALL"
codebuild_image = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
container_type  = "LINUX_CONTAINER"
privileged_mode = true
source_type     = "CODECOMMIT"

#------------------ CODEBUILD PROJECT SERVICE ROLE -------------------------------------------
create_codebuild-service-role       = true
crossac-codebuild-service-role_name = "crossac-codebuild-service-role"
crossac-codebuildinstancerole_name  = "crossac-codebuildinstancerole"


#----------------------------TEST-CASE DEV BACKENDSERVICE ----------------------------------------------
create_codebuild_dev-test = true
project_names_dev-test    = "crossac-dev-test"
ref_branch-name           = "refs/heads/master"


#---------------- CODEPIPELINE SERVICE ROLE & POLICY--------------------------------
create_codepipeline_role              = true
crossac-codepipelin_service_role_name = "crossac-codepipelin_service_role"
create_codepipeline_role_policy       = true
crossac-codepipeline_role_policy_name = "crossac-codepipeline_role_policy"
