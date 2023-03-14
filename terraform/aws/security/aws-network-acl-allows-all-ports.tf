# ruleid: aws-network-acl-allows-all-ports
resource "aws_network_acl_rule" "fail_1" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 200
  protocol       = "all"
  rule_action    = "allow"
  cidr_block     = "10.3.0.0/18"
}

# ruleid: aws-network-acl-allows-all-ports
resource "aws_network_acl_rule" "fail_2" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 200
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "10.3.0.0/18"
}

# ruleid: aws-network-acl-allows-all-ports
resource "aws_network_acl_rule" "fail_3" {
  rule_action    = "allow"
  network_acl_id = aws_network_acl.example.id
  rule_number    = 200
  protocol       = -1
  cidr_block     = "10.3.0.0/18"
}

resource "aws_network_acl" "fail_4" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-all-ports
  ingress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 0
    to_port    = 0
  }
}

resource "aws_network_acl" "fail_5" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-all-ports
  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 0
    to_port    = 0
  }
}

resource "aws_network_acl" "fail_6" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-all-ports
  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 0
    to_port    = 0
  }
}

resource "aws_network_acl" "fail_7" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-all-ports
  egress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 0
    to_port    = 0
  }
}

resource "aws_network_acl" "fail_8" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-all-ports
  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 0
    to_port    = 0
  }
}

resource "aws_network_acl" "fail_9" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-all-ports
  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 0
    to_port    = 0
  }
}

resource "aws_network_acl" "fail_10" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-all-ports
  ingress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 443
    to_port    = 443
  }
}

resource "aws_network_acl" "fail_11" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-all-ports
  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 443
    to_port    = 443
  }
}

resource "aws_network_acl" "fail_12" {
  vpc_id = aws_vpc.example.id

  # ruleid: aws-network-acl-allows-all-ports
  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 443
    to_port    = 443
  }
}

resource "aws_network_acl" "fail_13" {
  vpc_id = aws_vpc.example.id

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 80
    to_port    = 80
  }

  # ruleid: aws-network-acl-allows-all-ports
  egress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 0
    to_port    = 0
  }
}

resource "aws_network_acl" "fail_14" {
  vpc_id = aws_vpc.example.id

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 80
    to_port    = 80
  }

  # ruleid: aws-network-acl-allows-all-ports
  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 0
    to_port    = 0
  }
}

resource "aws_network_acl" "fail_15" {
  vpc_id = aws_vpc.example.id

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 80
    to_port    = 80
  }

  # ruleid: aws-network-acl-allows-all-ports
  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 0
    to_port    = 0
  }
}

# ok: aws-network-acl-allows-all-ports
resource "aws_network_acl_rule" "pass_1" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 200
  from_port      = 22
  to_port        = 22
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "10.3.0.0/18"
}

# ok: aws-network-acl-allows-all-ports
resource "aws_network_acl" "pass_2" {
  vpc_id = aws_vpc.example.id

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 80
    to_port    = 80
  }
}
