# ruleid: aws-ec2-instance-block-device-unencrypted
resource "aws_instance" "fail_1" {
  ami           = "ami-7f89a64f"
  instance_type = "t1.micro"
}

# ruleid: aws-ec2-instance-block-device-unencrypted
resource "aws_instance" "fail_1" {
  ami           = "ami-7f89a64f"
  instance_type = "t1.micro"

  root_block_device {
    volume_size = 5
    volume_type = "gp2"
  }
}

# ruleid: aws-ec2-instance-block-device-unencrypted
resource "aws_instance" "fail_2" {
  ami           = "ami-7f89a64f"
  instance_type = "t1.micro"

  root_block_device {
    volume_size = 5
    volume_type = "gp2"
    encrypted   = false
  }
}

resource "aws_instance" "fail_3" {
  ami           = "ami-7f89a64f"
  instance_type = "t1.micro"

  root_block_device {
    volume_size = 5
    volume_type = "gp2"
    encrypted   = true
  }

  # ruleid: aws-ec2-instance-block-device-unencrypted
  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 5
    volume_type = "gp2"
  }
}

resource "aws_instance" "fail_4" {
  ami           = "ami-7f89a64f"
  instance_type = "t1.micro"

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

  # ruleid: aws-ec2-instance-block-device-unencrypted
  ebs_block_device {
    device_name = "/dev/sda"
    volume_size = 5
    volume_type = "gp2"
  }
}

resource "aws_instance" "fail_5" {
  ami           = "ami-7f89a64f"
  instance_type = "t1.micro"

  root_block_device {
    volume_size = 5
    volume_type = "gp2"
    encrypted   = true
  }

  # ruleid: aws-ec2-instance-block-device-unencrypted
  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 5
    volume_type = "gp2"
    encrypted   = false
  }
}

resource "aws_instance" "fail_6" {
  ami           = "ami-7f89a64f"
  instance_type = "t1.micro"

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

  # ruleid: aws-ec2-instance-block-device-unencrypted
  ebs_block_device {
    device_name = "/dev/sda"
    volume_size = 5
    volume_type = "gp2"
    encrypted   = false
  }
}

# ok: aws-ec2-instance-block-device-unencrypted
resource "aws_instance" "pass_1" {
  ami           = "ami-7f89a64f"
  instance_type = "t1.micro"

  root_block_device {
    volume_size = 5
    volume_type = "gp2"
    encrypted   = true
  }
}

# ok: aws-ec2-instance-block-device-unencrypted
resource "aws_instance" "pass_2" {
  ami           = "ami-7f89a64f"
  instance_type = "t1.micro"

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
