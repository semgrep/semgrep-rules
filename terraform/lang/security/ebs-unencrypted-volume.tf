resource "aws_ebs_volume" "web_host_storage" {
  availability_zone = "ap-southeast-2"
  # ruleid: unencrypted-ebs-volume
  encrypted         = false
  size = 1
  tags = {
    Name = "abcd-ebs"
  }
}
