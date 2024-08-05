terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.60.0"
    }
  }
}

provider "aws" {
  region  = "us-west-1" #"${var.region}"
  profile = "abraham"
}
