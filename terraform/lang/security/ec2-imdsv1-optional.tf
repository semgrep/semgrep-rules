resource "aws_instance" "test-instance-bad-http-tokens-optional" {
  ami = "ami-0d5eff06f840b45e9"

  metadata_options {
    http_endpoint = "enabled"
    # ruleid: ec2-imdsv1-optional
    http_tokens = "optional"
  }
}

# ruleid: ec2-imdsv1-optional
resource "aws_instance" "test-instance-bad-no-metadata-options" {
  ami = "ami-0d5eff06f840b45e9"
}

# ruleid: ec2-imdsv1-optional
resource "aws_instance" "test-instance-bad-v3-http-tokens-default-optional" {
  ami = "ami-0d5eff06f840b45e9"
  metadata_options {
    http_endpoint = "enabled"
  }
}

resource "aws_instance" "test-instance-bad-http-tokens-optional-v2" {
  ami = "ami-0d5eff06f840b45e9"
  metadata_options {
    # ruleid: ec2-imdsv1-optional
    http_tokens = "optional"
  }
}

# ruleid: ec2-imdsv1-optional
resource "aws_instance" "test-instance-bad-all-default-values" {
  ami = "ami-0d5eff06f840b45e9"
  metadata_options {
    instance_metadata_tags = "enabled"
  }
}

# ok: ec2-imdsv1-optional
resource "aws_instance" "test-instance-good" {
  ami = "ami-0d5eff06f840b45e9"
  metadata_options {
    http_endpoint = "enabled"
    http_tokens = "required"
  }
}
