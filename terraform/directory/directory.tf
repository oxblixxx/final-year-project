# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/directory_service_directory
# Provides a Managed Microsoft directory in AWS Directory Service for the Workspace.

resource "aws_directory_service_directory" "directory" {
  name     = "unilorin.edu.ng"
  password = "SuperSecretPassw0rd"
  edition  = "Standard"
  size = "Small"
  type     = "MicrosoftAD"

  vpc_settings {
    vpc_id     = local.vpc_id
    subnet_ids = [ local.directory_subnet_1, local.directory_subnet_2 ]
  }

  tags = {
    Project = "foo"
    Environment = "production"
    Automated = "true"

  }
}
