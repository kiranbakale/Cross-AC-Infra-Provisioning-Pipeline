provider "aws" {
  region = var.region
}

terraform {
  required_version = ">=1.4.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.28.0"
    }
  }
}

 