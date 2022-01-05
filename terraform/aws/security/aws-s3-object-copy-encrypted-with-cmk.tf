resource "aws_s3_object_copy" "pass" {
  bucket             = aws_s3_bucket.target.bucket
  bucket_key_enabled = true
  key                = "test"
  kms_key_id         = aws_kms_key.test.arn
  source             = "${aws_s3_bucket.source.bucket}/${aws_s3_bucket_object.source.key}"
}
<<<<<<< HEAD
# ruleid: aws-s3-object-copy-encrypted-with-cmk
=======

>>>>>>> refs/remotes/origin/migrated-checkov-rules
resource "aws_s3_object_copy" "fail" {
  bucket             = aws_s3_bucket.target.bucket
  bucket_key_enabled = true
  key                = "test"
  source             = "${aws_s3_bucket.source.bucket}/${aws_s3_bucket_object.source.key}"
}