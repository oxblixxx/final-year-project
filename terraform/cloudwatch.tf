# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group
# Provides a CloudWatch Log Group resource.
resource "aws_cloudwatch_log_group" "directory_log" {
  name = "Unilorin-Workspace"

  tags = {
    Environment = "production"
    Application = "serviceA"
  }
}