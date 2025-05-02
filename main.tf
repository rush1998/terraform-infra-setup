terraform {
  backend "s3" {
    bucket         = "s3-terraform-state-7987"
    key            = "global/s3/terraform.tfstate" # Or per env: dev/network/terraform.tfstate
    region         = "us-east-1"
    dynamodb_table = "devops-course-DB"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  name       = "main-vpc"
}
