resource "aws_db_instance" "good_with_defaults" {
  # ok: rds-public-access
  allocated_storage = 10
  engine            = "mysql"
  engine_version    = "5.7"
  instance_class    = "db.t3.micro"
  name              = "mydb"
}

resource "aws_db_instance" "good" {
  allocated_storage   = 10
  engine              = "mysql"
  engine_version      = "5.7"
  instance_class      = "db.t3.micro"
  name                = "mydb"

  # ok: rds-public-access
  publicly_accessible = false
}

resource "aws_db_instance" "bad" {
  allocated_storage   = 10
  engine              = "mysql"
  engine_version      = "5.7"
  instance_class      = "db.t3.micro"
  name                = "mydb"

  # ruleid: rds-public-access
  publicly_accessible = true
}