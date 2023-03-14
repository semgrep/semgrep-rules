# ruleid: aws-ec2-instance-root-block-device-unencrypted
resource "aws_instance" "fail_1" {
  ami           = ami-7f89a64f
  instance_type = "t2.micro"
}

# ruleid: aws-ec2-instance-root-block-device-unencrypted
resource "aws_instance" "fail_2" {
  ami           = ami-7f89a64f
  instance_type = "t2.micro"

  root_block_device {
    volume_size = 5
    volume_type = "gp2"
  }
}

# ruleid: aws-ec2-instance-root-block-device-unencrypted
resource "aws_instance" "fail_3" {
  ami           = ami-7f89a64f
  instance_type = "t2.micro"

  root_block_device {
    volume_size = 5
    volume_type = "gp2"
    encrypted   = false
  }
}

# ok: aws-ec2-instance-root-block-device-unencrypted
resource "aws_instance" "pass_1" {
  ami           = ami-7f89a64f
  instance_type = "t2.micro"

  root_block_device {
    volume_size = 5
    volume_type = "gp2"
    encrypted   = true
  }
}
