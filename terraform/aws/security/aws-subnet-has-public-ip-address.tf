# ruleid: aws-subnet-has-public-ip-address
resource "aws_subnet" "fail_1" {
  vpc_id                  = "vpc-123456"
  map_public_ip_on_launch = true
}

# ruleid: aws-subnet-has-public-ip-address
resource "aws_default_subnet" "fail_2" {
  availability_zone = "us-west-2a"
}

# ruleid: aws-subnet-has-public-ip-address
resource "aws_default_subnet" "fail_3" {
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true
}

# ok: aws-subnet-has-public-ip-address
resource "aws_subnet" "pass_1" {
  vpc_id = "vpc-123456"
}

# ok: aws-subnet-has-public-ip-address
resource "aws_subnet" "pass_2" {
  vpc_id                  = "vpc-123456"
  map_public_ip_on_launch = false
}

# ok: aws-subnet-has-public-ip-address
resource "aws_default_subnet" "pass_3" {
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = false
}
