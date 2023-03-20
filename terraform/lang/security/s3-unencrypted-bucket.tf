resource "aws_s3_bucket" "unencrypted" {
  # ok: s3-unencrypted-bucket
  bucket = "my-unencrypted-bucket"
  acl    = "private"
}

# ok: s3-unencrypted-bucket
resource "aws_s3_bucket" "bucket" {
  bucket = "my-encrypted-bucket"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
