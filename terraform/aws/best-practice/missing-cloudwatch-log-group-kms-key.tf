# ruleid: missing-cloudwatch-log-group-kms-key
resource "aws_cloudwatch_log_group" "fail" {
  retention_in_days = 1
}

# ok: missing-cloudwatch-log-group-kms-key
resource "aws_cloudwatch_log_group" "pass" {
  retention_in_days = 1
  kms_key_id        = "someKey"
}
