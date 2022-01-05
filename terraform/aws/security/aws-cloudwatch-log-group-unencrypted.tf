resource "aws_cloudwatch_log_group" "pass" {
  retention_in_days = 1
  kms_key_id        = "someKey"
}
<<<<<<< HEAD
# ruleid: aws-cloudwatch-log-group-unencrypted
=======

>>>>>>> refs/remotes/origin/migrated-checkov-rules
resource "aws_cloudwatch_log_group" "fail" {
  retention_in_days = 1
}
