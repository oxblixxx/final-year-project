# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key
resource "aws_kms_key" "workspaces" {
  description = "internal efs key management"
  is_enabled = true
  enable_key_rotation = true
  #multi_region = true
  key_usage = "ENCRYPT_DECRYPT"
}

resource "aws_kms_key_policy" "workspaces" {
  key_id = aws_kms_key.workspaces.id
  policy = <<-EOF
{
  "Version": "2012-10-17",
  "Id": "key-consolepolicy-2",
  "Statement": [
    {
      "Sid": "Allow use of the key",
      "Effect": "Allow",
      "Principal": {"AWS": [
        "arn:aws:iam::${var.account_number}:root"
      ]},
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
EOF
  depends_on = [aws_kms_key.workspaces]
}
