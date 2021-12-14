# ruleid: missing-cloudwatch-log-group-retention
resource "aws_cloudwatch_log_group" "fail" {}

# ok: missing-cloudwatch-log-group-retention
resource "aws_cloudwatch_log_group" "pass" {
  retention_in_days = 3
}
