terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

# Configure the AWS Provider

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = var.tags
  }
}

# Added this to identify my Terraform Cloud Workspace for saving the Terraform State file for Collaboration
terraform {
  cloud {
    organization = "dwthomasjr"
    workspaces {
      name = "project3"
    }
  }
}