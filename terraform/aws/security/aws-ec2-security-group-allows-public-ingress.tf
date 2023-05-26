# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_open_1" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["0.0.0.0/0"]
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_open_1" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "0.0.0.0/0"
}

resource "aws_security_group" "fail_open_1" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_open_2" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["127.0.0.0/0"]
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_open_2" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "127.0.0.0/0"
}

resource "aws_security_group" "fail_open_2" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["127.0.0.0/0"]
  }
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_start_outside_loopback_1" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["127.0.0.0/2"] # 64.0.0.0 - 127.255.255.255
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_start_outside_loopback_1" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "127.0.0.0/2" # 64.0.0.0 - 127.255.255.255
}

resource "aws_security_group" "fail_start_outside_loopback_1" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["127.0.0.0/2"] # 64.0.0.0 - 127.255.255.255
  }
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_start_outside_loopback_2" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["127.99.99.99/2"] # 64.0.0.0 - 127.255.255.255
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_start_outside_loopback_2" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "127.99.99.99/2" # 64.0.0.0 - 127.255.255.255
}

resource "aws_security_group" "fail_start_outside_loopback_2" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["127.99.99.99/2"] # 64.0.0.0 - 127.255.255.255
  }
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_start_outside_loopback_3" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["127.255.255.255/2"] # 64.0.0.0 - 127.255.255.255
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_start_outside_loopback_3" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "127.255.255.255/2" # 64.0.0.0 - 127.255.255.255
}

resource "aws_security_group" "fail_start_outside_loopback_3" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["127.255.255.255/2"] # 64.0.0.0 - 127.255.255.255
  }
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_start_outside_loopback_4" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["126.0.0.0/7"] # 126.0.0.0 - 127.255.255.255
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_start_outside_loopback_4" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "126.0.0.0/7" # 126.0.0.0 - 127.255.255.255
}

resource "aws_security_group" "fail_start_outside_loopback_4" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["126.0.0.0/7"] # 126.0.0.0 - 127.255.255.255
  }
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_end_outside_private_network_1" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["10.0.0.0/7"] # 10.0.0.0 - 11.255.255.255
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_end_outside_private_network_1" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "10.0.0.0/7" # 10.0.0.0 - 11.255.255.255
}

resource "aws_security_group" "fail_end_outside_private_network_1" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["10.0.0.0/7"] # 10.0.0.0 - 11.255.255.255
  }
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_end_outside_private_network_2" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["10.99.99.99/7"] # 10.0.0.0 - 11.255.255.255
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_end_outside_private_network_2" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "10.99.99.99/7" # 10.0.0.0 - 11.255.255.255
}

resource "aws_security_group" "fail_end_outside_private_network_2" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["10.99.99.99/7"] # 10.0.0.0 - 11.255.255.255
  }
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_end_outside_private_network_3" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["10.255.255.255/7"] # 10.0.0.0 - 11.255.255.255
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_end_outside_private_network_3" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "10.255.255.255/7" # 10.0.0.0 - 11.255.255.255
}

resource "aws_security_group" "fail_end_outside_private_network_3" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["10.255.255.255/7"] # 10.0.0.0 - 11.255.255.255
  }
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_end_outside_private_network_4" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["11.0.0.0/7"] # 10.0.0.0 - 11.255.255.255
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_end_outside_private_network_4" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "11.0.0.0/7" # 10.0.0.0 - 11.255.255.255
}

resource "aws_security_group" "fail_end_outside_private_network_4" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["11.0.0.0/7"] # 10.0.0.0 - 11.255.255.255
  }
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_start_outside_private_network_5" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["172.16.0.0/11"] # 172.0.0.0 - 172.31.255.255
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_start_outside_private_network_5" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "172.16.0.0/11" # 172.0.0.0 - 172.31.255.255
}

resource "aws_security_group" "fail_start_outside_private_network_5" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["172.16.0.0/11"] # 172.0.0.0 - 172.31.255.255
  }
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_start_outside_private_network_6" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["172.16.99.99/11"] # 172.0.0.0 - 172.31.255.255
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_start_outside_private_network_6" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "172.16.99.99/11" # 172.0.0.0 - 172.31.255.255
}

resource "aws_security_group" "fail_start_outside_private_network_6" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["172.16.99.99/11"] # 172.0.0.0 - 172.31.255.255
  }
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_start_outside_private_network_7" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["172.16.255.255/11"] # 172.0.0.0 - 172.31.255.255
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_start_outside_private_network_7" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "172.16.255.255/11" # 172.0.0.0 - 172.31.255.255
}

resource "aws_security_group" "fail_start_outside_private_network_7" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["172.16.255.255/11"] # 172.0.0.0 - 172.31.255.255
  }
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_start_outside_private_network_8" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["172.15.0.0/12"] # 172.0.0.0 - 172.15.255.255
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_start_outside_private_network_8" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "172.15.0.0/12" # 172.0.0.0 - 172.31.255.255
}

resource "aws_security_group" "fail_start_outside_private_network_8" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["172.15.0.0/12"] # 172.0.0.0 - 172.15.255.255
  }
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_end_outside_private_network_9" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["192.168.0.0/15"] # 192.168.0.0 - 192.169.255.255
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_end_outside_private_network_9" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "192.168.0.0/15" # 192.168.0.0 - 192.169.255.255
}

resource "aws_security_group" "fail_end_outside_private_network_9" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["192.168.0.0/15"] # 192.168.0.0 - 192.169.255.255
  }
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_end_outside_private_network_10" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["192.168.99.99/15"] # 192.168.0.0 - 192.169.255.255
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_end_outside_private_network_10" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "192.168.99.99/15" # 192.168.0.0 - 192.169.255.255
}

resource "aws_security_group" "fail_end_outside_private_network_10" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["192.168.99.99/15"] # 192.168.0.0 - 192.169.255.255
  }
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_end_outside_private_network_11" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["192.168.255.255/15"] # 192.168.0.0 - 192.169.255.255
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_end_outside_private_network_11" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "192.168.255.255/15" # 192.168.0.0 - 192.169.255.255
}

resource "aws_security_group" "fail_end_outside_private_network_11" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["192.168.255.255/15"] # 192.168.0.0 - 192.169.255.255
  }
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_end_outside_private_network_12" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["192.169.0.0/15"] # 192.168.0.0 - 192.169.255.255
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_end_outside_private_network_12" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "192.169.0.0/15" # 192.168.0.0 - 192.169.255.255
}

resource "aws_security_group" "fail_end_outside_private_network_12" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["192.169.0.0/15"] # 192.168.0.0 - 192.169.255.255
  }
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_end_outside_link_local_1" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["169.254.0.0/15"] # 169.254.0.0 - 169.255.255.255
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_end_outside_link_local_1" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "169.254.0.0/15" # 169.254.0.0 - 169.255.255.255
}

resource "aws_security_group" "fail_end_outside_link_local_1" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["169.254.0.0/15"] # 169.254.0.0 - 169.255.255.255
  }
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_end_outside_link_local_2" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["169.254.99.99/15"] # 169.254.0.0 - 169.255.255.255
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_end_outside_link_local_2" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "169.254.99.99/15" # 169.254.0.0 - 169.255.255.255
}

resource "aws_security_group" "fail_end_outside_link_local_2" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["169.254.99.99/15"] # 169.254.0.0 - 169.255.255.255
  }
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_end_outside_link_local_3" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["169.254.255.255/15"] # 169.254.0.0 - 169.255.255.255
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_end_outside_link_local_3" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "169.254.255.255/15" # 169.254.0.0 - 169.255.255.255
}

resource "aws_security_group" "fail_end_outside_link_local_3" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["169.254.255.255/15"] # 169.254.0.0 - 169.255.255.255
  }
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_end_outside_link_local_4" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["169.255.0.0/15"] # 169.254.0.0 - 169.255.255.255
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_end_outside_link_local_4" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "169.255.0.0/15" # 169.254.0.0 - 169.255.255.255
}

resource "aws_security_group" "fail_end_outside_link_local_4" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["169.255.0.0/15"] # 169.254.0.0 - 169.255.255.255
  }
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_start_outside_shared_1" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["100.64.0.0/9"] # 100.0.0.0 - 100.127.255.255
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_end_outside_shared_1" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "100.64.0.0/9" # 100.0.0.0 - 100.127.255.255
}

resource "aws_security_group" "fail_end_outside_shared_1" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["100.64.0.0/9"] # 100.0.0.0 - 100.127.255.255
  }
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_start_outside_shared_2" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["100.64.99.99/9"] # 100.0.0.0 - 100.127.255.255
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_start_outside_shared_2" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "100.64.99.99/9" # 100.0.0.0 - 100.127.255.255
}

resource "aws_security_group" "fail_start_outside_shared_2" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["100.64.99.99/9"] # 100.0.0.0 - 100.127.255.255
  }
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_start_outside_shared_3" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["100.64.255.255/9"] # 100.0.0.0 - 100.127.255.255
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_start_outside_shared_3" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "100.64.255.255/9" # 100.0.0.0 - 100.127.255.255
}

resource "aws_security_group" "fail_start_outside_shared_3" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["100.64.255.255/9"] # 100.0.0.0 - 100.127.255.255
  }
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_start_outside_shared_4" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["100.65.0.0/9"] # 100.0.0.0 - 100.127.255.255
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_start_outside_shared_4" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "100.65.0.0/9" # 100.0.0.0 - 100.127.255.255
}

resource "aws_security_group" "fail_end_outside_shared_4" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["100.65.0.0/9"] # 100.0.0.0 - 100.127.255.255
  }
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_1" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["10.0.0.0/6"] # 8.0.0.0 - 11.255.255.255
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_1" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "10.0.0.0/6" # 8.0.0.0 - 11.255.255.255
}

resource "aws_security_group" "fail_1" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["10.0.0.0/6"] # 8.0.0.0 - 11.255.255.255
  }
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_2" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["172.16.0.0/2"] # 128.0.0.0 - 192.255.255.255
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_2" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "172.16.0.0/2" # 128.0.0.0 - 192.255.255.255
}

resource "aws_security_group" "fail_2" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["172.16.0.0/2"] # 128.0.0.0 - 192.255.255.255
  }
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_3" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["192.168.0.1/8"] # 192.0.0.0 - 192.255.255.255
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_3" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "192.168.0.1/8" # 192.0.0.0 - 192.255.255.255
}

resource "aws_security_group" "fail_3" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["192.168.0.1/8"] # 192.0.0.0 - 192.255.255.255
  }
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_4" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["169.254.0.0/14"] # 169.252.0.0 - 169.255.255.255
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_1" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "169.254.0.0/14" # 169.252.0.0 - 169.255.255.255
}

resource "aws_security_group" "fail_4" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["169.254.0.0/14"] # 169.252.0.0 - 169.255.255.255
  }
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "fail_5" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["100.64.0.0/8"] # 100.0.0.0 - 100.255.255.255
}

# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "fail_5" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "100.64.0.0/8" # 100.0.0.0 - 100.255.255.255
}

resource "aws_security_group" "fail_5" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["100.64.0.0/8"] # 100.0.0.0 - 100.255.255.255
  }
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "pass_inside_loopback_1" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["127.0.0.0/8"]
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "pass_inside_loopback_1" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "127.0.0.0/8"
}

resource "aws_security_group" "pass_inside_loopback_1" {
  vpc_id = aws_vpc.example.id

  # ok: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["127.0.0.0/8"]
  }
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "pass_inside_loopback_2" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["127.99.99.99/8"]
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "pass_inside_loopback_2" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "127.99.99.99/8"
}

resource "aws_security_group" "pass_inside_loopback_2" {
  vpc_id = aws_vpc.example.id

  # ok: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["127.99.99.99/8"]
  }
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "pass_inside_loopback_3" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["127.255.255.255/8"]
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "pass_inside_loopback_3" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "127.255.255.255/8"
}

resource "aws_security_group" "pass_inside_loopback_3" {
  vpc_id = aws_vpc.example.id

  # ok: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["127.255.255.255/8"]
  }
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "pass_inside_loopback_4" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["127.0.0.0/10"]
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "pass_inside_loopback_4" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "127.0.0.0/10"
}

resource "aws_security_group" "pass_inside_loopback_4" {
  vpc_id = aws_vpc.example.id

  # ok: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["127.0.0.0/10"]
  }
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "pass_inside_loopback_5" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["127.0.0.0/31"]
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "pass_inside_loopback_5" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "127.0.0.0/31"
}

resource "aws_security_group" "pass_inside_loopback_5" {
  vpc_id = aws_vpc.example.id

  # ok: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["127.0.0.0/31"]
  }
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "pass_inside_private_network_1" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["10.0.0.0/8"]
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "pass_inside_private_network_1" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "10.0.0.0/8"
}

resource "aws_security_group" "pass_inside_private_network_1" {
  vpc_id = aws_vpc.example.id

  # ok: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["10.0.0.0/8"]
  }
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "pass_inside_private_network_2" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["10.99.99.99/8"]
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "pass_inside_private_network_2" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "10.99.99.99/8"
}

resource "aws_security_group" "pass_inside_private_network_2" {
  vpc_id = aws_vpc.example.id

  # ok: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["10.99.99.99/8"]
  }
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "pass_inside_private_network_3" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["10.255.255.255/8"]
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "pass_inside_private_network_3" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "10.255.255.255/8"
}

resource "aws_security_group" "pass_inside_private_network_3" {
  vpc_id = aws_vpc.example.id

  # ok: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["10.255.255.255/8"]
  }
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "pass_inside_private_network_4" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["10.0.0.0/10"]
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "pass_inside_private_network_4" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "10.0.0.0/10"
}

resource "aws_security_group" "pass_inside_private_network_4" {
  vpc_id = aws_vpc.example.id

  # ok: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["10.0.0.0/10"]
  }
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "pass_inside_private_network_5" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["10.0.0.0/31"]
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "pass_inside_private_network_5" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "10.0.0.0/31"
}

resource "aws_security_group" "pass_inside_private_network_5" {
  vpc_id = aws_vpc.example.id

  # ok: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["10.0.0.0/31"]
  }
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "pass_inside_private_network_6" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["172.16.0.0/12"]
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "pass_inside_private_network_6" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "172.16.0.0/12"
}

resource "aws_security_group" "pass_inside_private_network_6" {
  vpc_id = aws_vpc.example.id

  # ok: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["172.16.0.0/12"]
  }
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "pass_inside_private_network_7" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["172.16.99.99/12"]
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "pass_inside_private_network_7" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "172.16.99.99/12"
}

resource "aws_security_group" "pass_inside_private_network_7" {
  vpc_id = aws_vpc.example.id

  # ok: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["172.16.99.99/12"]
  }
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "pass_inside_private_network_8" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["172.16.255.255/12"]
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "pass_inside_private_network_8" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "172.16.255.255/12"
}

resource "aws_security_group" "pass_inside_private_network_8" {
  vpc_id = aws_vpc.example.id

  # ok: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["172.16.255.255/12"]
  }
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "pass_inside_private_network_9" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["172.16.0.0/22"]
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "pass_inside_private_network_9" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "172.16.0.0/22"
}

resource "aws_security_group" "pass_inside_private_network_9" {
  vpc_id = aws_vpc.example.id

  # ok: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["172.16.0.0/22"]
  }
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "pass_inside_private_network_10" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["192.168.0.0/16"]
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "pass_inside_private_network_10" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "192.168.0.0/16"
}

resource "aws_security_group" "pass_inside_private_network_10" {
  vpc_id = aws_vpc.example.id

  # ok: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["192.168.0.0/16"]
  }
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "pass_inside_private_network_11" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["192.168.99.99/24"]
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "pass_inside_private_network_11" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "192.168.99.99/24"
}

resource "aws_security_group" "pass_inside_private_network_11" {
  vpc_id = aws_vpc.example.id

  # ok: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["192.168.99.99/24"]
  }
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "pass_inside_private_network_12" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["192.168.255.255/16"]
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "pass_inside_private_network_12" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "192.168.255.255/16"
}

resource "aws_security_group" "pass_inside_private_network_12" {
  vpc_id = aws_vpc.example.id

  # ok: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["192.168.255.255/16"]
  }
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "pass_inside_private_network_13" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["192.168.0.0/24"]
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "pass_inside_private_network_13" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "192.168.0.0/24"
}

resource "aws_security_group" "pass_inside_private_network_13" {
  vpc_id = aws_vpc.example.id

  # ok: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["192.168.0.0/24"]
  }
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "pass_inside_link_local_1" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["169.254.0.0/16"]
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "pass_inside_link_local_1" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "169.254.0.0/16"
}

resource "aws_security_group" "pass_inside_link_local_1" {
  vpc_id = aws_vpc.example.id

  # ok: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["169.254.0.0/16"]
  }
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "pass_inside_link_local_2" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["169.254.99.99/16"]
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "pass_inside_link_local_2" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "169.254.99.99/16"
}

resource "aws_security_group" "pass_inside_link_local_2" {
  vpc_id = aws_vpc.example.id

  # ok: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["169.254.99.99/16"]
  }
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "pass_inside_link_local_3" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["169.254.255.255/16"]
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "pass_inside_link_local_3" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "169.254.255.255/16"
}

resource "aws_security_group" "pass_inside_link_local_3" {
  vpc_id = aws_vpc.example.id

  # ok: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["169.254.255.255/16"]
  }
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "pass_inside_link_local_4" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["169.254.0.0/26"]
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "pass_inside_link_local_4" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "169.254.0.0/26"
}

resource "aws_security_group" "pass_inside_link_local_4" {
  vpc_id = aws_vpc.example.id

  # ok: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["169.254.0.0/26"]
  }
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "pass_inside_shared_1" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["100.64.0.0/10"]
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "pass_inside_shared_1" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "100.64.0.0/10"
}

resource "aws_security_group" "pass_inside_shared_1" {
  vpc_id = aws_vpc.example.id

  # ok: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["100.64.0.0/10"]
  }
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "pass_inside_shared_2" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["100.64.99.99/10"]
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "pass_inside_shared_2" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "100.64.99.99/10"
}

resource "aws_security_group" "pass_inside_shared_2" {
  vpc_id = aws_vpc.example.id

  # ok: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["100.64.99.99/10"]
  }
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "pass_inside_shared_3" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["100.64.255.255/10"]
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "pass_inside_shared_3" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "100.64.255.255/10"
}

resource "aws_security_group" "pass_inside_shared_3" {
  vpc_id = aws_vpc.example.id

  # ok: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["100.64.255.255/10"]
  }
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "pass_inside_shared_4" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["100.64.0.0/20"]
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "pass_inside_shared_4" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "100.64.0.0/20"
}

resource "aws_security_group" "pass_inside_shared_4" {
  vpc_id = aws_vpc.example.id

  # ok: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["100.64.0.0/20"]
  }
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "pass_single_ip_1" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["1.2.3.4/32"]
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "pass_single_ip_1" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "1.2.3.4/32"
}

resource "aws_security_group" "pass_single_ip_1" {
  vpc_id = aws_vpc.example.id

  # ok: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["1.2.3.4/32"]
  }
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "pass_single_ip_2" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["11.22.33.44/32"]
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "pass_single_ip_2" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "11.22.33.44/32"
}

resource "aws_security_group" "pass_single_ip_2" {
  vpc_id = aws_vpc.example.id

  # ok: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["11.22.33.44/32"]
  }
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "pass_single_ip_3" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["211.222.233.244/32"]
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "pass_single_ip_3" {
  security_group_id = aws_security_group.example.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "211.222.233.244/32"
}

resource "aws_security_group" "pass_single_ip_3" {
  vpc_id = aws_vpc.example.id

  # ok: aws-ec2-security-group-allows-public-ingress
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["211.222.233.244/32"]
  }
}

# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "pass_egress" {
  type        = "egress"
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group" "pass_egress" {
  vpc_id = aws_vpc.example.id

  # ok: aws-ec2-security-group-allows-public-ingress
  egress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
}
