# ruleid: ec2-imdsv1-optional
resource "aws_instance" "test-instance" {
  ami               = "ami-0d5eff06f840b45e9"  
  metadata_options {      
      http_endpoint = "enabled"
      http_tokens   = "optional"
 }
}
