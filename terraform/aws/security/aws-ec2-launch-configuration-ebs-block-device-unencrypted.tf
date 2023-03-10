resource "aws_launch_configuration" "fail_1" {
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  # ruleid: aws-ec2-launch-configuration-ebs-block-device-unencrypted
  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 5
    volume_type = "gp2"
  }
}

resource "aws_launch_configuration" "fail_2" {
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  # ruleid: aws-ec2-launch-configuration-ebs-block-device-unencrypted
  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 5
    volume_type = "gp2"
    encrypted   = false
  }
}

resource "aws_launch_configuration" "pass_fail_1" {
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  # ok: aws-ec2-launch-configuration-ebs-block-device-unencrypted
  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 5
    volume_type = "gp2"
    encrypted   = true
  }

  # ruleid: aws-ec2-launch-configuration-ebs-block-device-unencrypted
  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 5
    volume_type = "gp2"
  }
}

resource "aws_launch_configuration" "pass_fail_2" {
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  # ok: aws-ec2-launch-configuration-ebs-block-device-unencrypted
  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 5
    volume_type = "gp2"
    encrypted   = true
  }

  # ruleid: aws-ec2-launch-configuration-ebs-block-device-unencrypted
  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 5
    volume_type = "gp2"
    encrypted   = false
  }
}

# ok: aws-ec2-launch-configuration-ebs-block-device-unencrypted
resource "aws_launch_configuration" "pass_1" {
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
}

resource "aws_launch_configuration" "pass_2" {
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  # ok: aws-ec2-launch-configuration-ebs-block-device-unencrypted
  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 5
    volume_type = "gp2"
    encrypted   = true
  }
}
