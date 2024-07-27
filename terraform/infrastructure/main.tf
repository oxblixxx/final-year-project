provider "aws" {
  region = "eu-west-2"
}

# Configure statefile to be stored in Backend
# terraform {
#   backend "s3" {
#     bucket = "oxblixxxx-flow-log1234567"
#     key    = "infra/terraform.state"
#     region = "eu-west-2"
#   }
# }

