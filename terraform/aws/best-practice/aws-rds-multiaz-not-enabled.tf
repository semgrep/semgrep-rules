# fail
<<<<<<< HEAD
# ruleid: aws-rds-multiaz-not-enabled
=======
>>>>>>> refs/remotes/origin/migrated-checkov-rules
resource "aws_db_instance" "disabled" {
  name   = "name"
  engine = "mysql"

  identifier     = "id"
  instance_class = "foo"
  multi_az       = false
}

# fail
<<<<<<< HEAD
# ruleid: aws-rds-multiaz-not-enabled
=======
>>>>>>> refs/remotes/origin/migrated-checkov-rules
resource "aws_db_instance" "default" {
  name   = "name"
  engine = "mysql"

  identifier     = "id"
  instance_class = "foo"
}

# pass
resource "aws_db_instance" "enabled" {
  name   = "name"
  engine = "mysql"

  identifier     = "id"
  instance_class = "foo"
  multi_az       = true
}