resource "aws_cloudwatch_log_group" "pass" {
  retention_in_days = 3
}
<<<<<<< HEAD
# ruleid: aws-cloudwatch-log-group-no-retention
=======

>>>>>>> refs/remotes/origin/migrated-checkov-rules
resource "aws_cloudwatch_log_group" "fail" {}
