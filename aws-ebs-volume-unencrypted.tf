# ruleid: aws-ebs-volume-unencrypted
resource "aws_ebs_volume" "fail_1" {
  availability_zone = "us-west-2a"
}

# ruleid: aws-ebs-volume-unencrypted
resource "aws_ebs_volume" "fail_2" {
  availability_zone = "us-west-2a"
  encrypted         = false
}

# ok: aws-ebs-volume-unencrypted
resource "aws_ebs_volume" "pass" {
  availability_zone = "us-west-2a"
  encrypted         = true
}
