# pass

resource "aws_ebs_encryption_by_default" "enabled" {
  enabled = true
}

resource "aws_ebs_encryption_by_default" "default" {
}

# failure
<<<<<<< HEAD
# ruleid: aws-ebs-unencrypted
=======

>>>>>>> refs/remotes/origin/migrated-checkov-rules
resource "aws_ebs_encryption_by_default" "disabled" {
  enabled = false
}
