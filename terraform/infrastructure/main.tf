provider "aws" {
  region = "eu-west-2"
}

# Region for replicated directory service
provider "aws" {
  alias  = "secondary"
  region = "eu-west-1"
}


# Configure statefile to be stored in Backend
# terraform {
#   backend "s3" {
#     bucket = "oxblixxxx-flow-log1234567"
#     key    = "infra/terraform.state"
#     region = "eu-west-2"
#   }
# }

