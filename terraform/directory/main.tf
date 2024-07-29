provider "aws" {
  region = "eu-west-2"
}

provider "aws" {
  alias  = "secondary"
  region = "eu-west-2"
}

data "aws_region" "secondary_region" {
  provider = aws.secondary
}
# Configure the backend to use S3 for state file
# terraform {
#   backend "s3" {
#     bucket = "e5f28853-ed50-4181-acf4-83a9c8710645"
#     key    = "directory/terraform.state"
#     region = "us-east-1"
#   }
# }

# Configure data source to pull state file of infrastructure,
# data "terraform_remote_state" "infrastructure" {
#   backend = "s3"
#   config = {
#     bucket = "e5f28853-ed50-4181-acf4-83a9c8710645"
#     key    = "infra/terraform.state"
#     region = "us-east-1"
#   }
# }

# Configure data source to pull state file of infrastructure from local

data "terraform_remote_state" "infrastructure" {
  backend = "local"
  config = {
    path = "/workspace/final-year-project/terraform/infrastructure/terraform.tfstate"
  }
}

