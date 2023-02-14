# ok: aws-sns-topic-unencrypted
resource "aws_sns_topic" "pass" {
  kms_master_key_id = "someKey"
}
# ruleid: aws-sns-topic-unencrypted
resource "aws_sns_topic" "fail" {}
