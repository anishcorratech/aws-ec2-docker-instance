terraform {
  required_version = ">= 1.1.0"
  aws = {
    source  = "hashicorp/aws"
    version = "~> 4.49.0"
  }
}

provider "aws" {
  region = var.aws_region
}
