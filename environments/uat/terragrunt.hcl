terraform {
  source = "../../TF-files/"
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "your-region-code"
}
EOF
}

inputs = {
  env = "templates-uat"

  #------------ REGION ------------------------
  region = "your-region-code""

  # ------------ RESOURCE PREFIX ------------------------
  prefix = "crossac"


  # ------------------ ECR-NEW-VARS --------------------------------
  create_ecr_be      = true
  create_ecr_fe      = true
  backend_repo_name  = "backend-api"
  frontend_repo_name = "backend-ui"
  force_delete_value = false
  ecr_name_be        = "backend-service"
  ecr_name_fe        = "frontend-service"
  create_ecr_policy                = true
ecr_policy_name                  = "ecr_pull_policy"

}
