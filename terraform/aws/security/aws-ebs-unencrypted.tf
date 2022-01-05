# pass

resource "aws_ebs_encryption_by_default" "enabled" {
  enabled = true
}

resource "aws_ebs_encryption_by_default" "default" {
}

# failure
# ruleid: aws-ebs-unencrypted
resource "aws_ebs_encryption_by_default" "disabled" {
  enabled = false
}
