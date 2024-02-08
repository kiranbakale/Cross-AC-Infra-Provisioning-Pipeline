#------------ REGION ------------------------
variable "region" {
  default = "your-region-code"
}


#------------ ENVIRONMENT ---------------------
variable "env" {
  type = string
  default = "dev"
}


# ------------------ ECR --------------------------------
variable "create_ecr_be" {
  type    = bool
  default = true

}
variable "create_ecr_fe" {
  type    = bool
  default = true

}

variable "backend_repo_name" {
  type    = string
  default = "dev-backend"
}

variable "frontend_repo_name" {
  type    = string
  default = "dev-frontend"
}

variable "force_delete_value" {
  type    = bool
  default = true
}
variable "ecr_name_be" {
  type    = string
  default = "backend-service"
}

variable "ecr_name_fe" {
  type    = string
  default = "frontend-service"
}




