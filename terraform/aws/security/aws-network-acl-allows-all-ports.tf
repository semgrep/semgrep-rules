# ruleid: aws-network-acl-allows-all-ports
resource "aws_network_acl_rule" "fail_ingress_1" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 200
  protocol       = "all"
  rule_action    = "allow"
  cidr_block     = "10.3.0.0/18"
}

# ruleid: aws-network-acl-allows-all-ports
resource "aws_network_acl_rule" "fail_ingress_2" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 200
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "10.3.0.0/18"
}

# ruleid: aws-network-acl-allows-all-ports
resource "aws_network_acl_rule" "fail_ingress_3" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 200
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = "10.3.0.0/18"
}

resource "aws_network_acl" "fail_ingress_1" {
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

resource "aws_network_acl" "fail_ingress_2" {
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

resource "aws_network_acl" "fail_ingress_3" {
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

resource "aws_default_network_acl" "fail_ingress_1" {
  default_network_acl_id = aws_vpc.example.default_network_acl_id

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

resource "aws_default_network_acl" "fail_ingress_2" {
  default_network_acl_id = aws_vpc.example.default_network_acl_id

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

resource "aws_default_network_acl" "fail_ingress_3" {
  default_network_acl_id = aws_vpc.example.default_network_acl_id

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

resource "aws_network_acl" "fail_egress_1" {
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

resource "aws_network_acl" "fail_egress_2" {
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

resource "aws_network_acl" "fail_egress_3" {
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

resource "aws_default_network_acl" "fail_egress_1" {
  default_network_acl_id = aws_vpc.example.default_network_acl_id

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

resource "aws_default_network_acl" "fail_egress_2" {
  default_network_acl_id = aws_vpc.example.default_network_acl_id

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

resource "aws_default_network_acl" "fail_egress_3" {
  default_network_acl_id = aws_vpc.example.default_network_acl_id

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

resource "aws_network_acl" "fail_multiple_rules_1" {
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

resource "aws_network_acl" "fail_multiple_rules_2" {
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

resource "aws_network_acl" "fail_multiple_rules_3" {
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

resource "aws_network_acl" "fail_multiple_rules_4" {
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

resource "aws_network_acl" "fail_multiple_rules_5" {
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

resource "aws_network_acl" "fail_multiple_rules_6" {
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

resource "aws_default_network_acl" "fail_multiple_rules_1" {
  default_network_acl_id = aws_vpc.example.default_network_acl_id

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

resource "aws_default_network_acl" "fail_multiple_rules_2" {
  default_network_acl_id = aws_vpc.example.default_network_acl_id

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

resource "aws_default_network_acl" "fail_multiple_rules_3" {
  default_network_acl_id = aws_vpc.example.default_network_acl_id

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

resource "aws_default_network_acl" "fail_multiple_rules_4" {
  default_network_acl_id = aws_vpc.example.default_network_acl_id

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

resource "aws_default_network_acl" "fail_multiple_rules_5" {
  default_network_acl_id = aws_vpc.example.default_network_acl_id

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

resource "aws_default_network_acl" "fail_multiple_rules_6" {
  default_network_acl_id = aws_vpc.example.default_network_acl_id

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
resource "aws_network_acl_rule" "pass" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 200
  from_port      = 22
  to_port        = 22
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "10.3.0.0/18"
}

resource "aws_network_acl" "pass_multiple_rules" {
  vpc_id = aws_vpc.example.id

  # ok: aws-network-acl-allows-all-ports
  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 443
    to_port    = 443
  }

  # ok: aws-network-acl-allows-all-ports
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 80
    to_port    = 80
  }
}

resource "aws_default_network_acl" "pass_multiple_rules" {
  default_network_acl_id = aws_vpc.example.default_network_acl_id

  # ok: aws-network-acl-allows-all-ports
  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 443
    to_port    = 443
  }

  # ok: aws-network-acl-allows-all-ports
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 80
    to_port    = 80
  }
}
