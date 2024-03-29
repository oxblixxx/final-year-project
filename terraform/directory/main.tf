provider "aws" {
  region = "us-east-1"
}


# Configure the backend to use S3 for state file
terraform {
  backend "s3" {
    bucket = "e5f28853-ed50-4181-acf4-83a9c8710645"
    key    = "directory/terraform.state"
    region = "us-east-1"
  }
}

# Configure data source to pull state file of infrastructure,
data "terraform_remote_state" "infrastructure" {
  backend = "s3"
  config = {
    bucket = "e5f28853-ed50-4181-acf4-83a9c8710645"
    key    = "infra/terraform.state"
    region = "us-east-1"
  }
}
