provider "aws" {
  region = "eu-west-2"
}

# Configure statefile to be stored in Backend
terraform {
  backend "s3" {
    bucket = "e5f28853-ed50-4181-acf4-83a9c8710645"
    key    = "infra/terraform.state"
    region = "us-east-1"
  }
}

