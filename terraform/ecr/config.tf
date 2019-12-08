terraform {
  backend "s3" {
    bucket = "erapp"
    key    = "terraform/ecr/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}
