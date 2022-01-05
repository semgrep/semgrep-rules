resource "aws_efs_file_system" "pass" {
  encrypted  = true
  kms_key_id = aws_kms_key.test.arn
}
# ruleid: aws-efs-filesystem-encrypted-with-cmk
resource "aws_efs_file_system" "fail" {
  encrypted  = true
 }