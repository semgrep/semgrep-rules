# ruleid: aws-ec2-launch-configuration-block-device-unencrypted
resource "aws_launch_configuration" "fail_1" {
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
}

# ruleid: aws-ec2-launch-configuration-block-device-unencrypted
resource "aws_launch_configuration" "fail_1" {
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  root_block_device {
    volume_size = 5
    volume_type = "gp2"
  }
}

# ruleid: aws-ec2-launch-configuration-block-device-unencrypted
resource "aws_launch_configuration" "fail_2" {
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  root_block_device {
    volume_size = 5
    volume_type = "gp2"
    encrypted   = false
  }
}

resource "aws_launch_configuration" "fail_3" {
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  root_block_device {
    volume_size = 5
    volume_type = "gp2"
    encrypted   = true
  }

  # ruleid: aws-ec2-launch-configuration-block-device-unencrypted
  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 5
    volume_type = "gp2"
  }
}

resource "aws_launch_configuration" "fail_4" {
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  root_block_device {
    volume_size = 5
    volume_type = "gp2"
    encrypted   = true
  }

  # ruleid: aws-ec2-launch-configuration-block-device-unencrypted
  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 5
    volume_type = "gp2"
    encrypted   = false
  }
}

resource "aws_launch_configuration" "fail_5" {
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  root_block_device {
    volume_size = 5
    volume_type = "gp2"
    encrypted   = true
  }

  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 5
    volume_type = "gp2"
    encrypted   = true
  }

  # ruleid: aws-ec2-launch-configuration-block-device-unencrypted
  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 5
    volume_type = "gp2"
  }
}

resource "aws_launch_configuration" "fail_6" {
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  root_block_device {
    volume_size = 5
    volume_type = "gp2"
    encrypted   = true
  }

  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 5
    volume_type = "gp2"
    encrypted   = true
  }

  # ruleid: aws-ec2-launch-configuration-block-device-unencrypted
  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 5
    volume_type = "gp2"
    encrypted   = false
  }
}

# ok: aws-ec2-launch-configuration-block-device-unencrypted
resource "aws_launch_configuration" "pass_1" {
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  root_block_device {
    volume_size = 5
    volume_type = "gp2"
    encrypted   = true
  }
}

# ok: aws-ec2-launch-configuration-block-device-unencrypted
resource "aws_launch_configuration" "pass_2" {
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  root_block_device {
    volume_size = 5
    volume_type = "gp2"
    encrypted   = true
  }

  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 5
    volume_type = "gp2"
    encrypted   = true
  }
}
