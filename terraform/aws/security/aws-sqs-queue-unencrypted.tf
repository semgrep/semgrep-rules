# ruleid: aws-sqs-queue-unencrypted
resource "aws_sqs_queue" "fail_1" {
  name = "terraform-example-queue"
}

# ruleid: aws-sqs-queue-unencrypted
resource "aws_sqs_queue" "fail_2" {
  name                    = "terraform-example-queue"
  sqs_managed_sse_enabled = false
}

# ok: aws-sqs-queue-unencrypted
resource "aws_sqs_queue" "pass_1" {
  name                    = "terraform-example-queue"
  sqs_managed_sse_enabled = true
}

# ok: aws-sqs-queue-unencrypted
resource "aws_sqs_queue" "pass_2" {
  name                              = "terraform-example-queue"
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300
}
