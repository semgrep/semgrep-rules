resource "aws_instance" "test-instance-bad" {
  ami = "ami-0d5eff06f840b45e9"
  metadata_options {
    http_endpoint = "enabled"
    # ruleid: ec2-imdsv1-optional
    http_tokens = "optional"
  }
}
resource "aws_instance" "test-instance-good" {
  ami = "ami-0d5eff06f840b45e9"
  metadata_options {
    http_endpoint = "enabled"
    # ok: ec2-imdsv1-optional
    http_tokens = "required"
  }
}
