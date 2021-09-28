provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {}
}

data "terraform_remote_state" "infrastructure" {
  backend = "s3"

  config = {
    region = var.region
    bucket = var.remote_state_bucket
    key    = var.remote_state_key
  }
}

locals {
     prefix = "${var.prefix}-${var.environment}" #-${terraform.workspace}"
    common_tags = {
      Environment = var.environment  #terraform.workspace
      Project = var.project
      Owner = var.contact
      ManagedBy = "Terraform"
    }
}
