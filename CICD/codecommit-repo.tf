#----------------- Data Block of existing Repo -----------------------------

data "aws_codecommit_repository" "cross-account-infra-repo" {
  repository_name = "cross-account-infra-repo"
}