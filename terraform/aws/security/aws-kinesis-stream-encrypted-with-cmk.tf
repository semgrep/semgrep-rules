resource "aws_kinesis_stream" "pass" {
  name            = "test_stream-%[1]d"
  shard_count     = 1
  encryption_type = "KMS"
  kms_key_id      = aws_kms_key.sse_aws_kms_key_id.id
}
<<<<<<< HEAD
# ruleid: aws-kinesis-stream-encrypted-with-cmk
=======

>>>>>>> refs/remotes/origin/migrated-checkov-rules
resource "aws_kinesis_stream" "fail" {
  name            = "test_stream-%[1]d"
  shard_count     = 1
  encryption_type = "KMS"
}