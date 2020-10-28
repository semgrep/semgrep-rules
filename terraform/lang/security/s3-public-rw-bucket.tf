resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket"
  # ruleid: s3-public-rw-bucket
  acl    = "public-read-write"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
