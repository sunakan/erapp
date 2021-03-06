terraform {
  required_version = ">= 0.12"
}
provider "aws" {
  region = "ap-northeast-1"
}

module "iam" {
  source = "./iam"
}

module "ecr" {
  source = "./ecr"
}

module "vpc" {
  source = "./vpc"
}
