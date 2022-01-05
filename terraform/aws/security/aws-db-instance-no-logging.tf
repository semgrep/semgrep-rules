# pass

resource "aws_db_instance" "postgres" {
  allocated_storage = 5
  engine            = "postgres"
  instance_class    = "db.t3.small"
  password          = "postgres"
  username          = "postgres"

  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]
}

resource "aws_db_instance" "mysql" {
  allocated_storage = 5
  engine            = "mysql"
  instance_class    = "db.t3.small"
  password          = "mysql"
  username          = "mysql"

  enabled_cloudwatch_logs_exports = ["general", "error", "slowquery"]
}

# failure
<<<<<<< HEAD
# ruleid: aws-db-instance-no-logging
=======

>>>>>>> refs/remotes/origin/migrated-checkov-rules
resource "aws_db_instance" "default" {
  allocated_storage = 5
  engine            = "mysql"
  instance_class    = "db.t3.small"
  password          = "mysql"
  username          = "mysql"
}
<<<<<<< HEAD
# ruleid: aws-db-instance-no-logging
=======

>>>>>>> refs/remotes/origin/migrated-checkov-rules
resource "aws_db_instance" "empty" {
  allocated_storage = 5
  engine            = "mysql"
  instance_class    = "db.t3.small"
  password          = "mysql"
  username          = "mysql"

  enabled_cloudwatch_logs_exports = []
}
