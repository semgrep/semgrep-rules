# ruleid: aws-ec2-launch-template-metadata-service-v1-enabled
resource "aws_launch_template" "fail_1" {
  name = "example"
}

# ruleid: aws-ec2-launch-template-metadata-service-v1-enabled
resource "aws_launch_template" "fail_2" {
  name = "example"

  metadata_options {
    http_put_response_hop_limit = 2
  }
}

# ruleid: aws-ec2-launch-template-metadata-service-v1-enabled
resource "aws_launch_template" "fail_3" {
  name = "example"

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 2
  }
}

# ruleid: aws-ec2-launch-template-metadata-service-v1-enabled
resource "aws_launch_template" "fail_4" {
  name = "example"

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "optional"
  }
}

# ruleid: aws-ec2-launch-template-metadata-service-v1-enabled
resource "aws_launch_template" "fail_5" {
  name = "example"

  metadata_options {
    http_put_response_hop_limit = 2
    http_tokens                 = "optional"
  }
}

# ok: aws-ec2-launch-template-metadata-service-v1-enabled
resource "aws_launch_template" "pass_1" {
  name = "example"

  metadata_options {
    http_endpoint = "disabled"
  }
}

# ok: aws-ec2-launch-template-metadata-service-v1-enabled
resource "aws_launch_template" "pass_2" {
  name = "example"

  metadata_options {
    http_tokens = "required"
  }
}

# ok: aws-ec2-launch-template-metadata-service-v1-enabled
resource "aws_launch_template" "pass_2" {
  name = "example"

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }
}
