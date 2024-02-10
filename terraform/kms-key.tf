# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key
resource "aws_kms_key" "internal_efs" {
  description = "internal efs key management"
  is_enabled = true
  enable_key_rotation = true
  multi_region = true
  key_usage = "ENCRYPT_DECRYPT"
}

resource "aws_kms_key_policy" "internal_efs" {
  key_id = aws_kms_key.internal_efs.id
  policy = <<-EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1707531765822",
      "Action": [
        "kms:Create*",
        "kms:Describe*",
        "kms:Enable*",
        "kms:List*",
        "kms:Put*",
        "kms:Update*",
        "kms:Revoke*",
        "kms:Disable*",
        "kms:Get*",
        "kms:Delete*",
        "kms:TagResource",
        "kms:UntagResource",
        "kms:ScheduleKeyDeletion",
        "kms:CancelKeyDeletion"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Principal": {
        "Service": "elasticfilesystem.amazonaws.com"
      }
    }
  ]
}
EOF
  depends_on = [aws_kms_key.internal_efs]
}
