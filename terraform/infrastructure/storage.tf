# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "flow_log_bucket" {
  bucket        = "oxblixxxx-flow-log1234"
  force_destroy = false
  tags = {
    Terraform   = "true"
    Environment = "dev"
    Project     = "unilorin-workspace"
  }
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



