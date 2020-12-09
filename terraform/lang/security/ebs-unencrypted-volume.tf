resource "aws_ebs_volume" "web_host_storage" {
  availability_zone = "ap-southeast-2"
  encrypted         = false
  size = 1
  # ruleid: unencrypted-ebs-volume
  tags = {
    Name = "abcd-ebs"
  }
}
