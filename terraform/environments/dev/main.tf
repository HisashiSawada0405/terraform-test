resource "aws_s3_bucket" "test" {
  bucket        = "sawada-t4-test"
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "test" {
  bucket = aws_s3_bucket.test.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_acl" "test" {
  bucket = aws_s3_bucket.test.id
  acl    = "private"
}

resource "aws_s3_bucket_acl" "aaa" {
  bucket = aws_s3_bucket.aaa.id
  acl    = "private"
}

# tfsec:ignore:aws-s3-encryption-customer-key  一旦AES256にするため無視する
resource "aws_s3_bucket_server_side_encryption_configuration" "test" {
  bucket = aws_s3_bucket.test.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
