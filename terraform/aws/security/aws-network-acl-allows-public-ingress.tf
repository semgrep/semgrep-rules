# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_open_1" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl" "fail_open_1" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "0.0.0.0/0"
  }
}

resource "aws_default_network_acl" "fail_open_1" {
  default_network_acl_id = aws_vpc.example.default_network_acl_id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "0.0.0.0/0"
  }
}

# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_open_2" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "127.0.0.0/0"
}

resource "aws_network_acl" "fail_open_2" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "127.0.0.0/0"
  }
}

# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_start_outside_loopback_1" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "127.0.0.0/2" # 64.0.0.0 - 127.255.255.255
}

resource "aws_network_acl" "fail_start_outside_loopback_1" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "127.0.0.0/2" # 64.0.0.0 - 127.255.255.255
  }
}

# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_start_outside_loopback_2" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "127.99.99.99/2" # 64.0.0.0 - 127.255.255.255
}

resource "aws_network_acl" "fail_start_outside_loopback_2" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "127.99.99.99/2" # 64.0.0.0 - 127.255.255.255
  }
}

# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_start_outside_loopback_3" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "127.255.255.255/2" # 64.0.0.0 - 127.255.255.255
}

resource "aws_network_acl" "fail_start_outside_loopback_3" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "127.255.255.255/2" # 64.0.0.0 - 127.255.255.255
  }
}

# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_start_outside_loopback_4" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "126.0.0.0/7" # 126.0.0.0 - 127.255.255.255
}

resource "aws_network_acl" "fail_start_outside_loopback_4" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "126.0.0.0/7" # 126.0.0.0 - 127.255.255.255
  }
}

# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_end_outside_private_network_1" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "10.0.0.0/7" # 10.0.0.0 - 11.255.255.255
}

resource "aws_network_acl" "fail_end_outside_private_network_1" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "10.0.0.0/7" # 10.0.0.0 - 11.255.255.255
  }
}

# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_end_outside_private_network_2" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "10.99.99.99/7" # 10.0.0.0 - 11.255.255.255
}

resource "aws_network_acl" "fail_end_outside_private_network_2" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "10.99.99.99/7" # 10.0.0.0 - 11.255.255.255
  }
}

# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_end_outside_private_network_3" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "10.255.255.255/7" # 10.0.0.0 - 11.255.255.255
}

resource "aws_network_acl" "fail_end_outside_private_network_3" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "10.255.255.255/7" # 10.0.0.0 - 11.255.255.255
  }
}

# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_end_outside_private_network_4" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "11.0.0.0/7" # 10.0.0.0 - 11.255.255.255
}

resource "aws_network_acl" "fail_end_outside_private_network_4" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "11.0.0.0/7" # 10.0.0.0 - 11.255.255.255
  }
}

# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_start_outside_private_network_5" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "172.16.0.0/11" # 172.0.0.0 - 172.31.255.255
}

resource "aws_network_acl" "fail_start_outside_private_network_5" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "172.16.0.0/11" # 172.0.0.0 - 172.31.255.255
  }
}

# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_start_outside_private_network_6" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "172.16.99.99/11" # 172.0.0.0 - 172.31.255.255
}

resource "aws_network_acl" "fail_start_outside_private_network_6" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "172.16.99.99/11" # 172.0.0.0 - 172.31.255.255
  }
}

# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_start_outside_private_network_7" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "172.16.255.255/11" # 172.0.0.0 - 172.31.255.255
}

resource "aws_network_acl" "fail_start_outside_private_network_7" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "172.16.255.255/11" # 172.0.0.0 - 172.31.255.255
  }
}

# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_start_outside_private_network_8" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "172.15.0.0/12" # 172.0.0.0 - 172.15.255.255
}

resource "aws_network_acl" "fail_start_outside_private_network_8" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "172.15.0.0/12" # 172.0.0.0 - 172.15.255.255
  }
}

# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_end_outside_private_network_9" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "192.168.0.0/15" # 192.168.0.0 - 192.169.255.255
}

resource "aws_network_acl" "fail_end_outside_private_network_9" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "192.168.0.0/15" # 192.168.0.0 - 192.169.255.255
  }
}

# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_end_outside_private_network_10" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "192.168.99.99/15" # 192.168.0.0 - 192.169.255.255
}

resource "aws_network_acl" "fail_end_outside_private_network_10" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "192.168.99.99/15" # 192.168.0.0 - 192.169.255.255
  }
}

# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_end_outside_private_network_11" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "192.168.255.255/15" # 192.168.0.0 - 192.169.255.255
}

resource "aws_network_acl" "fail_end_outside_private_network_11" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "192.168.255.255/15" # 192.168.0.0 - 192.169.255.255
  }
}

# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_end_outside_private_network_12" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "192.169.0.0/15" # 192.168.0.0 - 192.169.255.255
}

resource "aws_network_acl" "fail_end_outside_private_network_12" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "192.169.0.0/15" # 192.168.0.0 - 192.169.255.255
  }
}

# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_end_outside_link_local_1" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "169.254.0.0/15" # 169.254.0.0 - 169.255.255.255
}

resource "aws_network_acl" "fail_end_outside_link_local_1" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "169.254.0.0/15" # 169.254.0.0 - 169.255.255.255
  }
}

# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_end_outside_link_local_2" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "169.254.99.99/15" # 169.254.0.0 - 169.255.255.255
}

resource "aws_network_acl" "fail_end_outside_link_local_2" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "169.254.99.99/15" # 169.254.0.0 - 169.255.255.255
  }
}

# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_end_outside_link_local_3" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "169.254.255.255/15" # 169.254.0.0 - 169.255.255.255
}

resource "aws_network_acl" "fail_end_outside_link_local_3" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "169.254.255.255/15" # 169.254.0.0 - 169.255.255.255
  }
}

# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_end_outside_link_local_4" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "169.255.0.0/15" # 169.254.0.0 - 169.255.255.255
}

resource "aws_network_acl" "fail_end_outside_link_local_4" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "169.255.0.0/15" # 169.254.0.0 - 169.255.255.255
  }
}

# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_start_outside_shared_1" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "100.64.0.0/9" # 100.0.0.0 - 100.127.255.255
}

resource "aws_network_acl" "fail_start_outside_shared_1" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "100.64.0.0/9" # 100.0.0.0 - 100.127.255.255
  }
}

# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_start_outside_shared_2" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "100.64.99.99/9" # 100.0.0.0 - 100.127.255.255
}

resource "aws_network_acl" "fail_start_outside_shared_2" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "100.64.99.99/9" # 100.0.0.0 - 100.127.255.255
  }
}

# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_start_outside_shared_3" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "100.64.255.255/9" # 100.0.0.0 - 100.127.255.255
}

resource "aws_network_acl" "fail_end_outside_shared_3" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "100.64.255.255/9" # 100.0.0.0 - 100.127.255.255
  }
}

# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_start_outside_shared_4" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "100.65.0.0/9" # 100.0.0.0 - 100.127.255.255
}

resource "aws_network_acl" "fail_end_outside_shared_4" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "100.65.0.0/9" # 100.0.0.0 - 100.127.255.255
  }
}

# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_1" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "10.0.0.0/6" # 8.0.0.0 - 11.255.255.255
}

resource "aws_network_acl" "fail_1" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "10.0.0.0/6" # 8.0.0.0 - 11.255.255.255
  }
}

# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_2" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "172.16.0.0/2" # 128.0.0.0 - 192.255.255.255
}

resource "aws_network_acl" "fail_2" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "172.16.0.0/2" # 128.0.0.0 - 192.255.255.255
  }
}

# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_3" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "192.168.0.1/8" # 192.0.0.0 - 192.255.255.255
}

resource "aws_network_acl" "fail_3" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "192.168.0.1/8" # 192.0.0.0 - 192.255.255.255
  }
}

# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_4" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "169.254.0.0/14" # 169.252.0.0 - 169.255.255.255
}

resource "aws_network_acl" "fail_4" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "169.254.0.0/14" # 169.252.0.0 - 169.255.255.255
  }
}

# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "fail_5" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "100.64.0.0/8" # 100.0.0.0 - 100.255.255.255
}

resource "aws_network_acl" "fail_5" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "100.64.0.0/8" # 100.0.0.0 - 100.255.255.255
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_inside_loopback_1" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "127.0.0.0/8"
}

resource "aws_network_acl" "pass_inside_loopback_1" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "127.0.0.0/8"
  }
}

resource "aws_default_network_acl" "pass_inside_loopback_1" {
  default_network_acl_id = aws_vpc.example.default_network_acl_id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "127.0.0.0/8"
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_inside_loopback_2" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "127.99.99.99/8"
}

resource "aws_network_acl" "pass_inside_loopback_2" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "127.99.99.99/8"
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_inside_loopback_3" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "127.255.255.255/8"
}

resource "aws_network_acl" "pass_inside_loopback_3" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "127.255.255.255/8"
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_inside_loopback_4" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "127.0.0.0/10"
}

resource "aws_network_acl" "pass_inside_loopback_4" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "127.0.0.0/10"
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_inside_loopback_5" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "127.0.0.0/31"
}

resource "aws_network_acl" "pass_inside_loopback_5" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "127.0.0.0/31"
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_inside_private_network_1" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "10.0.0.0/8"
}

resource "aws_network_acl" "pass_inside_private_network_1" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "10.99.99.99/8"
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_inside_private_network_2" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "10.99.99.99/8"
}

resource "aws_network_acl" "pass_inside_private_network_2" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "10.99.99.99/8"
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_inside_private_network_3" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "10.255.255.255/8"
}

resource "aws_network_acl" "pass_inside_private_network_3" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "10.255.255.255/8"
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_inside_private_network_4" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "10.0.0.0/10"
}

resource "aws_network_acl" "pass_inside_private_network_4" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "10.0.0.0/10"
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_inside_private_network_5" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "10.0.0.0/31"
}

resource "aws_network_acl" "pass_inside_private_network_5" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "10.0.0.0/31"
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_inside_private_network_6" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "172.16.0.0/12"
}

resource "aws_network_acl" "pass_inside_private_network_6" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "172.16.0.0/12"
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_inside_private_network_7" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "172.16.99.99/12"
}

resource "aws_network_acl" "pass_inside_private_network_7" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "172.16.99.99/12"
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_inside_private_network_8" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "172.16.255.255/12"
}

resource "aws_network_acl" "pass_inside_private_network_8" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "172.16.255.255/12"
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_inside_private_network_9" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "172.16.0.0/22"
}

resource "aws_network_acl" "pass_inside_private_network_9" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "172.16.0.0/22"
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_inside_private_network_10" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "192.168.0.0/16"
}

resource "aws_network_acl" "pass_inside_private_network_10" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "192.168.0.0/16"
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_inside_private_network_11" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "192.168.99.99/24"
}

resource "aws_network_acl" "pass_inside_private_network_11" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "192.168.99.99/24"
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_inside_private_network_12" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "192.168.255.255/16"
}

resource "aws_network_acl" "pass_inside_private_network_12" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "192.168.255.255/16"
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_inside_private_network_13" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "192.168.0.0/24"
}

resource "aws_network_acl" "pass_inside_private_network_13" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "192.168.0.0/24"
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_inside_link_local_1" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "169.254.0.0/16"
}

resource "aws_network_acl" "pass_inside_link_local_1" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "169.254.0.0/16"
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_inside_link_local_2" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "169.254.99.99/16"
}

resource "aws_network_acl" "pass_inside_link_local_2" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "169.254.99.99/16"
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_inside_link_local_3" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "169.254.255.255/16"
}

resource "aws_network_acl" "pass_inside_link_local_3" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "169.254.255.255/16"
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_inside_link_local_4" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "169.254.0.0/26"
}

resource "aws_network_acl" "pass_inside_link_local_4" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "169.254.0.0/26"
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_inside_shared_1" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "100.64.0.0/10"
}

resource "aws_network_acl" "pass_inside_shared_1" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "100.64.0.0/10"
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_inside_shared_2" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "100.64.99.99/10"
}

resource "aws_network_acl" "pass_inside_shared_2" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "100.64.99.99/10"
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_inside_shared_3" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "100.64.255.255/10"
}

resource "aws_network_acl" "pass_inside_shared_3" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "100.64.255.255/10"
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_inside_shared_4" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "100.64.0.0/20"
}

resource "aws_network_acl" "pass_inside_shared_4" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "100.64.0.0/20"
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_single_ip_1" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "1.2.3.4/32"
}

resource "aws_network_acl" "pass_single_ip_1" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "1.2.3.4/32"
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_single_ip_2" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "11.22.33.44/32"
}

resource "aws_network_acl" "pass_single_ip_2" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "11.22.33.44/32"
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_single_ip_3" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "211.222.233.244/32"
}

resource "aws_network_acl" "pass_single_ip_3" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "211.222.233.244/32"
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_deny_ingress" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "deny"
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl" "pass_deny_ingress" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "deny"
    cidr_block = "0.0.0.0/0"
  }
}

resource "aws_default_network_acl" "pass_deny_ingress" {
  default_network_acl_id = aws_vpc.example.default_network_acl_id

  # ok: aws-network-acl-allows-public-ingress
  ingress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "deny"
    cidr_block = "0.0.0.0/0"
  }
}

# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "pass_egress" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 1
  egress         = true
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl" "pass_egress" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-public-ingress
  egress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "0.0.0.0/0"
  }
}

resource "aws_default_network_acl" "pass_egress" {
  default_network_acl_id = aws_vpc.example.default_network_acl_id

  # ok: aws-network-acl-allows-public-ingress
  egress {
    rule_no    = 1
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    action     = "allow"
    cidr_block = "0.0.0.0/0"
  }
}
