# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "unilorin"
  cidr = "10.0.0.0/16"

  azs                = ["eu-west-2a", "eu-west-2b", "eu-west-2c", "eu-west-2d"]
  private_subnets    = ["10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
  public_subnets     = ["10.0.101.0/24", "10.0.102.0/24"]
  enable_nat_gateway = true
  single_nat_gateway = true 
  tags = {
    Terraform   = "true"
    Environment = "dev"
    Project     = "unilorin-workspace"
  }
}




# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log

resource "aws_flow_log" "main_vpc" {
  log_destination      = aws_s3_bucket.flow_log_bucket.arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = module.vpc.vpc_id
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}