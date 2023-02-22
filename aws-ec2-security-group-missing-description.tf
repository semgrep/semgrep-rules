# ruleid: aws-ec2-security-group-missing-description
resource "aws_security_group" "fail_1" {
  name = "http"

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }
}

# ruleid: aws-ec2-security-group-missing-description
resource "aws_security_group" "fail_2" {
  name        = "http"
  description = ""

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }
}

# ok: aws-ec2-security-group-missing-description
resource "aws_security_group" "pass" {
  name        = "http"
  description = "Allow inbound HTTP traffic"

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }
}
