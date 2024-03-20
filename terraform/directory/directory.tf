# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/directory_service_directory

# Provides a Managed Microsoft directory in AWS Directory Service for the Workspace.
resource "aws_directory_service_directory" "directory" {
  name     = "unilorin.edu.ng"
  password = "SuperSecretPassw0rd"
  edition  = "Standard"
  size = "Small"
  type     = "MicrosoftAD"

  vpc_settings {
    vpc_id     = aws_vpc.main_vpc.id
    subnet_ids = [for subnet in aws_subnet.private_subnet_directory : subnet.id]
  }

  tags = {
    Project = "foo"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/directory_service_log_subscription
# Provides a Log subscription for AWS Directory Service that pushes logs to cloudwatch.
# resource "aws_directory_service_log_subscription" "directory_log_1" {
#   count = var.directory_controller
#   directory_id   = aws_directory_service_directory.directory[0].id  
#   log_group_name = aws_cloudwatch_log_group.directory_log.name
# }

# resource "aws_directory_service_log_subscription" "directory_log_2" {
#   count = var.directory_controller
#   directory_id   = aws_directory_service_directory.directory[1].id  
#   log_group_name = aws_cloudwatch_log_group.directory_log.name
# }