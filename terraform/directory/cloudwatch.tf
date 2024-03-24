# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group
# Provides a CloudWatch Log Group resource.
resource "aws_cloudwatch_log_group" "directory_log" {
  name = "Unilorin-Workspace"

  tags = {
    Environment = "production"
    Application = "serviceA"
    Automated = "true"
  }
}


# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/directory_service_log_subscription
# Provides a Log subscription for AWS Directory Service that pushes logs to cloudwatch.
resource "aws_directory_service_log_subscription" "directory_log_1" {
  directory_id   = aws_directory_service_directory.directory.id  
  log_group_name = aws_cloudwatch_log_group.directory_log.name
}
