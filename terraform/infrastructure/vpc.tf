# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

resource "aws_vpc" "main_vpc" {
  cidr_block           = "192.168.0.0/24"
  instance_tenancy     = "default"
  enable_dns_hostnames = var.bool
  tags = {
    Name = "main-vpc"
  }
  
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log

resource "aws_flow_log" "main_vpc" {
  log_destination      = aws_s3_bucket.flow_log_bucket.arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = aws_vpc.main_vpc.id
}