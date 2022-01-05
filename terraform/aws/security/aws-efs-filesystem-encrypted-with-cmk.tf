resource "aws_efs_file_system" "pass" {
  encrypted  = true
  kms_key_id = aws_kms_key.test.arn
}
<<<<<<< HEAD
# ruleid: aws-efs-filesystem-encrypted-with-cmk
=======

>>>>>>> refs/remotes/origin/migrated-checkov-rules
resource "aws_efs_file_system" "fail" {
  encrypted  = true
 }