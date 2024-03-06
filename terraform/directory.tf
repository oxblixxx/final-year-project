# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/directory_service_directory

# Provides a Managed Microsoft directory in AWS Directory Service for the Workspace.
resource "aws_directory_service_directory" "unilorin" {
  count = 2
  name     = "unilorin.edu.ng"
  password = "SuperSecretPassw0rd"
  edition  = "Standard"
  size = "small"
  type     = "MicrosoftAD"

  vpc_settings {
    vpc_id     = aws_vpc.main_vpc.id
    subnet_ids = [aws_subnet.private_subnet_main.count.index[2]]
  }

  tags = {
    Project = "foo"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/directory_service_log_subscription
# Provides a Log subscription for AWS Directory Service that pushes logs to cloudwatch.
resource "aws_directory_service_log_subscription" "unilorin" {
  directory_id   = aws_directory_service_directory.unilorin.id
  log_group_name = aws_cloudwatch_log_group.example.name
}