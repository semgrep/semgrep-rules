# pass

resource "aws_db_instance" "enabled_mysql" {
  allocated_storage = 5
  engine            = "postgres"
  instance_class    = "db.t3.small"
  password          = "password"
  username          = "username"

  iam_database_authentication_enabled = true
}

resource "aws_db_instance" "enabled_postgres" {
  allocated_storage = 5
  engine            = "postgres"
  instance_class    = "db.t3.small"
  password          = "password"
  username          = "username"

  iam_database_authentication_enabled = true
}

# failure
# ruleid: aws-rds-iam-authentication-not-enabled
resource "aws_db_instance" "default_mysql" {
  allocated_storage = 5
  engine            = "mysql"
  instance_class    = "db.t3.small"
  password          = "password"
  username          = "username"
}
# ruleid: aws-rds-iam-authentication-not-enabled
resource "aws_db_instance" "default_postgres" {
  allocated_storage = 5
  engine            = "postgres"
  instance_class    = "db.t3.small"
  password          = "password"
  username          = "username"
}
# ruleid: aws-rds-iam-authentication-not-enabled
resource "aws_db_instance" "disabled_mysql" {
  allocated_storage = 5
  engine            = "postgres"
  instance_class    = "db.t3.small"
  password          = "password"
  username          = "username"

  iam_database_authentication_enabled = false
}
# ruleid: aws-rds-iam-authentication-not-enabled
resource "aws_db_instance" "disabled_postgres" {
  allocated_storage = 5
  engine            = "postgres"
  instance_class    = "db.t3.small"
  password          = "password"
  username          = "username"

  iam_database_authentication_enabled = false
}

# unknown

# ruleid: aws-rds-iam-authentication-not-enabled
resource "aws_db_instance" "mariadb" {
  allocated_storage = 5
  engine            = "mariadb"
  instance_class    = "db.t3.small"
  password          = "password"
  username          = "username"
}
