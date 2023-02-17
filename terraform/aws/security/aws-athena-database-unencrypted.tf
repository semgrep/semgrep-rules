# ruleid: aws-athena-database-unencrypted
resource "aws_athena_database" "fail" {
  name   = "database_name"
  bucket = aws_s3_bucket.example.bucket
}

# ok: aws-athena-database-unencrypted
resource "aws_athena_database" "pass" {
  name   = "database_name"
  bucket = aws_s3_bucket.example.bucket

  encryption_configuration {
    encryption_option = "SSE_KMS"
    kms_key_arn       = aws_kms_key.example.arn
  }
}
