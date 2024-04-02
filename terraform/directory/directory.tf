# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/directory_service_directory
# Provides a Managed Microsoft directory in AWS Directory Service for the Workspace.

resource "aws_directory_service_directory" "directory" {
  name     = "unilorin.edu.ng"
  password = data.hcp_vault_secrets_app.directory_secrets.secrets.aws_directory_service_directory_directory_passwd
  edition  = "Standard"
  size     = "Small"
  type     = "MicrosoftAD"

  vpc_settings {
    vpc_id     = local.vpc_id
    subnet_ids = [local.directory_subnet_1, local.directory_subnet_2]
  }

  tags = {
    Project     = var.project
    Environment = var.environment
    Terraform   = var.terraform

  }
}


# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/key_pair
# This pulls an already created keypair via console
data "aws_key_pair" "key_pair" {
  key_name           = "ox-2023-aug"
  include_public_key = true
}

# output "fingerprint" {
#   value = data.aws_key_pair.key_pair
# }

