# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_file_system
#https://docs.aws.amazon.com/efs/latest/ug/performance.html  
resource "aws_efs_file_system" "internal_efs" {
  creation_token = "internal_efs_priv_01"
  encrypted = true
  kms_key_id = aws_kms_key.internal_efs.id
  lifecycle_policy {
    transition_to_archive = "AFTER_30_DAYS"
    transition_to_ia = "AFTER_60_DAYS"
    transition_to_primary_storage_class = "AFTER_1_ACCESS"
  }
  protection {
    replication_overwrite = "DISABLED"
  }
  throughput_mode = "elastic"
  performance_mode = "genralPurpose"
}

resource "aws_efs_mount_target" "internal_efs" {
  file_system_id  = aws_efs_file_system.internal_efs.id
  subnet_id       = aws_subnet.private_subnet.id
  security_groups = ["aws_security_group.internal_efs"]
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_backup_policy
resource "aws_efs_backup_policy" "policy" {
  file_system_id = aws_efs_file_system.internal_efs.id

  backup_policy {
    status = "ENABLED"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_replication_configuration
resource "aws_efs_replication_configuration" "internal_efs_02" {
  source_file_system_id = aws_efs_file_system.internal_efs.id

  destination {
    availability_zone_name = "us-west-2b"
    kms_key_id             = aws_kms_key.internal_efs.id
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_access_point#argument-reference
resource "aws_efs_access_point" "internal_efs" {
  file_system_id = aws_efs_file_system.internal_efs.id

}