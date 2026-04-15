# --- provider指定 ---
# デフォルトは東京リージョンを指定
terraform {
  required_version = ">= 1.14.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  profile = "s3-api-lambda"
  region  = "ap-northeast-1"
}
