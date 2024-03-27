# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/directory_service_directory
# Provides a Managed Microsoft directory in AWS Directory Service for the Workspace.

resource "aws_directory_service_directory" "directory" {
  name     = "unilorin.edu.ng"
  password = "@Unilroinedng1"
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


# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/key_pair
data "aws_key_pair" "key_pair" {
  key_name           = "ox-2023-aug"
  include_public_key = true
}

output "fingerprint" {
  value = data.aws_key_pair.key_pair
}


resource "null_resource" "create_compute_engine" {
  provisioner "local-exec" {
    command = <<-EOT
      aws ssm start-automation-execution \
      --document-name "AWS-CreateDSManagementInstance" \
      --document-version "\$DEFAULT" \
      --parameters '{
          "DirectoryId":["'${aws_directory_service_directory.directory.id}'"],
          "Tags":[
          "{\"Key\":\"Description\",\"Value\":\"Created by AWS Systems Manager Automation\"}",
          "{\"Key\":\"Created By\",\"Value\":\"AWS Systems Manager Automation\"}"
          ],
          "KeyPairName":["'"${data.aws_key_pair.key_pair.key_name}"'"],
          "IamInstanceProfileName":["AmazonSSMDirectoryServiceInstanceProfileRole"],
          "SecurityGroupName":["AmazonSSMDirectoryServiceSecurityGroup"],
          "AmiId":["{{ssm:/aws/service/ami-windows-latest/Windows_Server-2019-English-Full-Base}}"],
          "InstanceType":["t3.medium"],
          "RemoteAccessCidr":["10.0.0.0/16"],
          "MetadataOptions":["{\"HttpEndpoint\":\"enabled\",\"HttpTokens\":\"optional\"}"]
          }' \
      --region us-east-1

    EOT
  }
  depends_on = [ aws_directory_service_directory.directory ]
}
