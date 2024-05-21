# Creates and attach a Compute engine to the Directory created
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
          "InstanceType":["${var.instance_type}"],
          "RemoteAccessCidr":["10.0.0.0/16"],
          "MetadataOptions":["{\"HttpEndpoint\":\"enabled\",\"HttpTokens\":\"optional\"}"]
          }' \
      --region ${var.compute_engine_region}

    EOT
  }
  depends_on = [aws_directory_service_directory.directory]
}


# 
# resource "aws_launch_template" "bastion-host" {
#   name = "bastion-host"

#   block_device_mappings {
#     device_name = "/dev/sda1"  # Assuming the root volume for Windows is usually /dev/sda1

#     ebs {
#       volume_size = 50  # Adjust the volume size as needed for your Windows instance
#     }
#   }

#   capacity_reservation_specification {
#     capacity_reservation_preference = "open"
#   }

#   cpu_options {
#     core_count       = 2  # Adjust core count as needed
#     threads_per_core = 2
#   }

#   credit_specification {
#     cpu_credits = "standard"
#   }

#   disable_api_stop        = true
#   disable_api_termination = true

#   ebs_optimized = true

# #   iam_instance_profile {
# #     name = "test"  # Replace with your IAM instance profile for Windows
# #   }

#   image_id = "ami-03cd80cfebcbb4481"
#   instance_initiated_shutdown_behavior = "terminate"
#   instance_type = "t2.micro"  
#   key_name = data.aws_key_pair.key_pair

#   monitoring {
#     enabled = true
#   }

#   network_interfaces {
#     associate_public_ip_address = true
#   }

#   placement {
#     availability_zone = "eu-west-2a"
#   }

#   vpc_security_group_ids = [data.terraform_remote_state.infrastructure.outputs.security_group]

#   tag_specifications {
#     resource_type = "instance"

#     tags = {
#     Name = "Bastion host"
#     Terraform   = "true"
#     Environment = "dev"
#     }
#   }

#   #user_data = filebase64("${path.module}/example.sh")  # If you have user data specific to Windows, adjust accordingly
# }

# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group
# resource "aws_autoscaling_group" "asg" {
#   availability_zones = ["eu-west-1a"]
#   desired_capacity   = 1
#   max_size           = 1
#   min_size           = 1

#   launch_template {
#     id      = aws_launch_template.bastion-host.id
#     version = "$Latest"
#   }
# }



