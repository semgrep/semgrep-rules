resource "aws_ebs_volume" "web_host_storage" {
  # unencrypted volume
  availability_zone = "ap-southeast-2"
  encrypted         = true  # Setting this causes the volume to be recreated on apply 
  size = 1
  tags = {
    Name = "abcd-ebs"
  }
}