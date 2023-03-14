resource "aws_instance" "fail_1" {
  ami           = "ami-7f89a64f"
  instance_type = "t2.micro"

  # ruleid: aws-ec2-instance-ebs-block-device-unencrypted
  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 5
    volume_type = "gp2"
  }
}

resource "aws_instance" "fail_2" {
  ami           = "ami-7f89a64f"
  instance_type = "t2.micro"

  # ruleid: aws-ec2-instance-ebs-block-device-unencrypted
  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 5
    volume_type = "gp2"
    encrypted   = false
  }
}

resource "aws_instance" "pass_fail_1" {
  ami           = "ami-7f89a64f"
  instance_type = "t2.micro"

  # ok: aws-ec2-instance-ebs-block-device-unencrypted
  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 5
    volume_type = "gp2"
    encrypted   = true
  }

  # ruleid: aws-ec2-instance-ebs-block-device-unencrypted
  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 5
    volume_type = "gp2"
  }
}

resource "aws_instance" "pass_fail_2" {
  ami           = "ami-7f89a64f"
  instance_type = "t2.micro"

  # ok: aws-ec2-instance-ebs-block-device-unencrypted
  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 5
    volume_type = "gp2"
    encrypted   = true
  }

  # ruleid: aws-ec2-instance-ebs-block-device-unencrypted
  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 5
    volume_type = "gp2"
    encrypted   = false
  }
}

# ok: aws-ec2-instance-ebs-block-device-unencrypted
resource "aws_instance" "pass_1" {
  ami           = "ami-7f89a64f"
  instance_type = "t2.micro"
}

resource "aws_instance" "pass_2" {
  ami           = "ami-7f89a64f"
  instance_type = "t2.micro"

  # ok: aws-ec2-instance-ebs-block-device-unencrypted
  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 5
    volume_type = "gp2"
    encrypted   = true
  }
}
