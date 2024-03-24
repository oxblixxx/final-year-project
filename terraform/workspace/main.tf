provider "aws" {
  # Configuration options
  region = "us-east-1"
}


terraform {
  # Configure the backend using the `backend` block
  backend "s3" {
    # Replace these values with your S3 bucket and access key details
    bucket = "e5f28853-ed50-4181-acf4-83a9c8710645"
    key    = "workspace/terraform.state"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "infra" {
  backend = "s3"

  config = {
    bucket = "e5f28853-ed50-4181-acf4-83a9c8710645"
    key    = "infra/terraform.state"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "directory" {
  backend = "s3"

  config = {
    bucket = "e5f28853-ed50-4181-acf4-83a9c8710645"
    key    = "directory/terraform.state"
    region = "us-east-1"
  }
}
