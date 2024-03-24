# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/workspaces_workspace
# Provides a workspace in AWS Workspaces Service
data "aws_workspaces_bundle" "value_windows_10" {
  bundle_id = "wsb-bh8rsxt14" # Value with Windows 10 (English)
}



resource "aws_workspaces_workspace" "unilorin" {
  directory_id = local.directory_id
  bundle_id    = data.aws_workspaces_bundle.value_windows_10.id
  user_name    = "administrator"

  root_volume_encryption_enabled = true
  user_volume_encryption_enabled = true
  volume_encryption_key          = aws_kms_key.workspaces.arn

  workspace_properties {
    compute_type_name                         = "STANDARD"
    user_volume_size_gib                      = 100
    root_volume_size_gib                      = 80
    running_mode                              = "AUTO_STOP"
    running_mode_auto_stop_timeout_in_minutes = 60
  }

  tags = {
    Department = "Telecommunication-Science"
  }
}

# resource "aws_workspaces_workspace" "unilorin_1" {
#   directory_id = aws_directory_service_directory.directory.id
#   bundle_id    = data.aws_workspaces_bundle.value_windows_10.id
#   user_name    = "john.doe"

#   root_volume_encryption_enabled = true
#   user_volume_encryption_enabled = true
#   volume_encryption_key          = aws_kms_key.workspaces.arn

#   workspace_properties {
#     compute_type_name                         = "STANDARD"
#     user_volume_size_gib                      = 100
#     root_volume_size_gib                      = 80
#     running_mode                              = "AUTO_STOP"
#     running_mode_auto_stop_timeout_in_minutes = 60
#   }

#   tags = {
#     Department = "Telecommunication-Science"
#   }
# }


# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/workspaces_directory
# Provides a WorkSpaces directory in AWS WorkSpaces Service, Connecting MICROSOFT AD directory.
# resource "aws_workspaces_directory" "directory" {
#   directory_id = aws_directory_service_directory.directory.id
#   subnet_ids = [for subnet in aws_subnet.private_subnet_directory : subnet.id]

#   tags = {
#     Example = true
#   }

#   self_service_permissions {
#     change_compute_type  = true
#     increase_volume_size = true
#     rebuild_workspace    = true
#     restart_workspace    = true
#     switch_running_mode  = true
#   }

#   workspace_access_properties {
#     device_type_android    = "ALLOW"
#     device_type_chromeos   = "ALLOW"
#     device_type_ios        = "ALLOW"
#     device_type_linux      = "ALLOW"
#     device_type_osx        = "ALLOW"
#     device_type_web        = "ALLOW"
#     device_type_windows    = "ALLOW"
#     device_type_zeroclient = "DENY"
#   }

#   workspace_creation_properties {
#     custom_security_group_id            = aws_security_group.public_subnet_main.id
#     default_ou                          = "OU=AWS,DC=Workgroup,DC=Example,DC=com"
#     enable_internet_access              = true
#     enable_maintenance_mode             = true
#     user_enabled_as_local_administrator = true
#   }

#   depends_on = [
#     aws_iam_role_policy_attachment.workspaces_default_service_access,
#     aws_iam_role_policy_attachment.workspaces_default_self_service_access
#   ]
# }


# resource "aws_workspaces_directory" "directory_1" {
#   directory_id = aws_directory_service_directory.directory[1].id
#   subnet_ids = [for subnet in aws_subnet.private_subnet_directory : subnet.id]

#   tags = {
#     Example = true
#   }

#   self_service_permissions {
#     change_compute_type  = true
#     increase_volume_size = true
#     rebuild_workspace    = true
#     restart_workspace    = true
#     switch_running_mode  = true
#   }

#   workspace_access_properties {
#     device_type_android    = "ALLOW"
#     device_type_chromeos   = "ALLOW"
#     device_type_ios        = "ALLOW"
#     device_type_linux      = "ALLOW"
#     device_type_osx        = "ALLOW"
#     device_type_web        = "ALLOW"
#     device_type_windows    = "ALLOW"
#     device_type_zeroclient = "DENY"
#   }

#   workspace_creation_properties {
#     custom_security_group_id            = aws_security_group.public_subnet_main.id
#     default_ou                          = "OU=AWS,DC=Workgroup,DC=Example,DC=com"
#     enable_internet_access              = true
#     enable_maintenance_mode             = true
#     user_enabled_as_local_administrator = true
#   }

#   depends_on = [
#     aws_iam_role_policy_attachment.workspaces_default_service_access,
#     aws_iam_role_policy_attachment.workspaces_default_self_service_access
#   ]
# }

# aws workspaces register-workspace-directory \
#     --directory-id d-926722edaf \
#     --no-enable-work-docs


# aws workspaces register-workspace-directory \
#     --directory-id d-9067fb43fb \ 
#     [--subnet-ids subnet-0f005f9addd7a1f71,subnet-00ab01279149c36ec] \  
#     --enable-work-docs \
#     --enable-self-service