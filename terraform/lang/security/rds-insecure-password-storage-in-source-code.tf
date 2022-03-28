##
## aws_db_instance resources
##

# Test case 1: No password specified (OK)
resource "aws_db_instance" "no_password" {
  # ok: rds-insecure-password-storage-in-source-code
  allocated_storage = 10
  engine            = "mysql"
  engine_version    = "5.7"
  instance_class    = "db.t3.micro"
  name              = "mydb"
}

# Test case 2: Password specified from a random data source (OK)
resource "random_password" "password" {
  length  = 64
  special = false
}
resource "aws_db_instance" "password_not_hardcoded" {
  # ok: rds-insecure-password-storage-in-source-code
  allocated_storage = 10
  engine            = "mysql"
  engine_version    = "5.7"
  instance_class    = "db.t3.micro"
  name              = "mydb"
  username          = "admin"
  password          = random_password.password.result
}

# Test case 3: Password hardcoded (NOK)
resource "aws_db_instance" "password_not_hardcoded" {
  allocated_storage = 10
  engine            = "mysql"
  engine_version    = "5.7"
  instance_class    = "db.t3.micro"
  name              = "mydb"
  username          = "admin"

  # ruleid: rds-insecure-password-storage-in-source-code
  password = "p455w0rd"
}

##
## aws_rds_cluster resources
##

# Test case 1: No password specified (OK)
resource "aws_rds_cluster" "default" {
  # ok: rds-insecure-password-storage-in-source-code
  cluster_identifier      = "aurora-cluster-demo"
  engine                  = "aurora-mysql"
  engine_version          = "5.7.mysql_aurora.2.03.2"
  availability_zones      = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name           = "mydb"
}

# Test case 2: Password specified from a random data source (OK)
resource "aws_rds_cluster" "default" {
  cluster_identifier      = "aurora-cluster-demo"
  engine                  = "aurora-mysql"
  engine_version          = "5.7.mysql_aurora.2.03.2"
  availability_zones      = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name           = "mydb"
  master_username         = "foo"

  # ok: rds-insecure-password-storage-in-source-code
  master_password         = random_password.password.result
}

# Test case 3: Password hardcoded (NOK)
resource "aws_rds_cluster" "default" {
  cluster_identifier      = "aurora-cluster-demo"
  engine                  = "aurora-mysql"
  engine_version          = "5.7.mysql_aurora.2.03.2"
  availability_zones      = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name           = "mydb"
  master_username         = "foo"

  # ruleid: rds-insecure-password-storage-in-source-code
  master_password         = "bar"
}