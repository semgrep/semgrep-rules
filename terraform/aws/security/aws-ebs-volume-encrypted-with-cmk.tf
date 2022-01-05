resource "aws_ebs_volume" "pass" {
  availability_zone = data.aws_availability_zones.available.names[0]
  size              = 1
  encrypted         = true
  kms_key_id        = aws_kms_key.test.arn

  tags = {
    Name = "taggy"
  }
}
<<<<<<< HEAD
# ruleid: aws-ebs-volume-encrypted-with-cmk
=======

>>>>>>> refs/remotes/origin/migrated-checkov-rules
resource "aws_ebs_volume" "fail" {
  availability_zone = data.aws_availability_zones.available.names[0]
  size              = 1
  encrypted         = true

  tags = {
    Name = "taggy"
  }
}