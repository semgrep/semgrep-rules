# ruleid: aws-ec2-security-group-rule-missing-description
resource "aws_security_group" "fail_1" {
  name        = "http"
  description = "Allow inbound HTTP traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }
}

# ruleid: aws-ec2-security-group-rule-missing-description
resource "aws_security_group" "fail_2" {
  name        = "http"
  description = "Allow outbound HTTP traffic"

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }
}

# ruleid: aws-ec2-security-group-rule-missing-description
resource "aws_security_group_rule" "fail_3" {
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.main.cidr_block]
  security_group_id = "sg-123456"
}

resource "aws_security_group" "fail_4" {
  name        = "http"
  description = "Allow inbound HTTP traffic"

  ingress {
    # ruleid: aws-ec2-security-group-rule-missing-description
    description = ""
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }
}

resource "aws_security_group" "fail_5" {
  name        = "http"
  description = "Allow outbound HTTP traffic"

  egress {
    # ruleid: aws-ec2-security-group-rule-missing-description
    description = ""
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }
}

resource "aws_security_group_rule" "fail_6" {
  # ruleid: aws-ec2-security-group-rule-missing-description
  description       = ""
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.main.cidr_block]
  security_group_id = "sg-123456"
}

resource "aws_security_group" "pass_1" {
  name        = "http"
  # ruleid: aws-ec2-security-group-rule-missing-description
  description = "Managed by Terraform"

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }
}

resource "aws_security_group" "pass_1" {
  name        = "http"
  description = "Something"

  ingress {
    # ruleid: aws-ec2-security-group-rule-missing-description
    description = "Managed by Terraform"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }
}

resource "aws_security_group" "pass_2" {
  name        = "http"
  description = "HTTP to VPC"

  egress {
    # ruleid: aws-ec2-security-group-rule-missing-description
    description = "Managed by Terraform"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }
}

resource "aws_security_group_rule" "pass_3" {
  # ruleid: aws-ec2-security-group-rule-missing-description
  description       = "Managed by Terraform"
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.main.cidr_block]
  security_group_id = "sg-123456"
}

# ok: aws-ec2-security-group-rule-missing-description
resource "aws_security_group" "pass_1" {
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

# ok: aws-ec2-security-group-rule-missing-description
resource "aws_security_group" "pass_2" {
  name        = "http"
  description = "Allow outbound HTTP traffic"

  egress {
    description = "HTTP to VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }
}

# ok: aws-ec2-security-group-rule-missing-description
resource "aws_security_group_rule" "pass_3" {
  description       = "Allow outbound HTTP traffic"
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.main.cidr_block]
  security_group_id = "sg-123456"
}

# ruleid: aws-ec2-security-group-rule-missing-description
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

resource "aws_security_group" "fail_2" {
  name        = "http"
  # ruleid: aws-ec2-security-group-rule-missing-description
  description = ""

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }
}

# ok: aws-ec2-security-group-rule-missing-description
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

