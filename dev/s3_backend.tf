terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket-0001"
    key            = "dev/terraform.tfstate"
    region         = "ap-northeast-1"
    dynamodb_table = "terraform-lock"
    profile        = "s3-api-lambda"
  }
}