resource "aws_cloudwatch_log_group" "pass" {
  retention_in_days = 3
}
# ruleid: aws-cloudwatch-log-group-no-retention
resource "aws_cloudwatch_log_group" "fail" {}
