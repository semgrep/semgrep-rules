# pass

resource "aws_rds_cluster" "enabled" {
  master_username         = "username"
  master_password         = "password"

  iam_database_authentication_enabled = true
}

# failure
<<<<<<< HEAD
# ruleid: aws-rds-cluster-iam-authentication-not-enabled
=======

>>>>>>> refs/remotes/origin/migrated-checkov-rules
resource "aws_rds_cluster" "default" {
  master_username         = "username"
  master_password         = "password"
}
<<<<<<< HEAD
# ruleid: aws-rds-cluster-iam-authentication-not-enabled
=======

>>>>>>> refs/remotes/origin/migrated-checkov-rules
resource "aws_rds_cluster" "disabled" {
  master_username         = "username"
  master_password         = "password"

  iam_database_authentication_enabled = false
}
