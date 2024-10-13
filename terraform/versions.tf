terraform {
  backend "s3" {
    bucket = "my-tfstate-bucket-hogehoge"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.71.0"
    }
  }

  required_version = ">= 1.9.0"
}
