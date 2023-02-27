# ruleid: aws-ec2-instance-metadata-service-v1-enabled
resource "aws_instance" "fail_1" {
  ami           = "ami-7f89a64f"
  instance_type = "t1.micro"
}

# ruleid: aws-ec2-instance-metadata-service-v1-enabled
resource "aws_instance" "fail_2" {
  ami           = "ami-7f89a64f"
  instance_type = "t1.micro"

  metadata_options {
    http_put_response_hop_limit = 2
  }
}

# ruleid: aws-ec2-instance-metadata-service-v1-enabled
resource "aws_instance" "fail_3" {
  ami           = "ami-7f89a64f"
  instance_type = "t1.micro"

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 2
  }
}

# ruleid: aws-ec2-instance-metadata-service-v1-enabled
resource "aws_instance" "fail_4" {
  ami           = "ami-7f89a64f"
  instance_type = "t1.micro"

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "optional"
  }
}

# ruleid: aws-ec2-instance-metadata-service-v1-enabled
resource "aws_instance" "fail_5" {
  ami           = "ami-7f89a64f"
  instance_type = "t1.micro"

  metadata_options {
    http_put_response_hop_limit = 2
    http_tokens                 = "optional"
  }
}

# ok: aws-ec2-instance-metadata-service-v1-enabled
resource "aws_instance" "pass_1" {
  ami           = "ami-7f89a64f"
  instance_type = "t1.micro"

  metadata_options {
    http_endpoint = "disabled"
  }
}

# ok: aws-ec2-instance-metadata-service-v1-enabled
resource "aws_instance" "pass_2" {
  ami           = "ami-7f89a64f"
  instance_type = "t1.micro"

  metadata_options {
    http_tokens = "required"
  }
}

# ok: aws-ec2-instance-metadata-service-v1-enabled
resource "aws_instance" "pass_2" {
  ami           = "ami-7f89a64f"
  instance_type = "t1.micro"

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }
}
