# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "flow_log_bucket" {
  bucket        = "oxblixxxx-flow-log1234567"
  force_destroy = false
  tags = {
    Terraform   = "true"
    Environment = "dev"
    Project     = "unilorin-workspace"
  }
}

resource "aws_s3_bucket_policy" "my_bucket_policy" {
  bucket = "oxblixxxx-flow-log1234567"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "s3:ListBucket"
        Resource = "arn:aws:s3:::oxblixxxx-flow-log123467"
      },
      {
        Effect = "Allow"
        Principal = "*"
        Action = ["s3:GetObject", "s3:PutObject"]
        Resource = "arn:aws:s3:::oxblixxxx-flow-log123467"
      }
    ]
  })
}



# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl
resource "aws_s3_bucket_acl" "flow_log_bucket" {
  depends_on = [aws_s3_bucket_ownership_controls.flow_log_bucket]

  bucket = aws_s3_bucket.flow_log_bucket.id
  acl    = "private"

}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls
resource "aws_s3_bucket_ownership_controls" "flow_log_bucket" {
  bucket = aws_s3_bucket.flow_log_bucket.id

  rule {
    object_ownership = "ObjectWriter"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning
resource "aws_s3_bucket_versioning" "flow_log_bucket" {
  bucket = aws_s3_bucket.flow_log_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}



