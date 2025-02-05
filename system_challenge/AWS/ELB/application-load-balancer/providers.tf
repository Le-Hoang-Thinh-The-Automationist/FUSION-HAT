terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region                   = var.deploy_region
  shared_config_files      = ["../../../__aws_key/config"]
  shared_credentials_files = ["../../../__aws_key/credentials"]
  profile                  = "default"
}