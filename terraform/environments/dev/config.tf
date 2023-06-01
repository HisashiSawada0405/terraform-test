terraform {
  required_version = ">= 1.0.0, < 2.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.44.0" # config.tf ファイル作成時の最新バージョンを指定
    }
  }
  backend "s3" {
    bucket  = "kakin-dev-tfstate"
    key     = "test.state"
    region  = "ap-northeast-1"
    encrypt = true
  }
}

provider "aws" {
  region  = "ap-northeast-1"
}
