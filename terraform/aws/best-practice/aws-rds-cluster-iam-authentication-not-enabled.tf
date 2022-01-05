# pass

resource "aws_rds_cluster" "enabled" {
  master_username         = "username"
  master_password         = "password"

  iam_database_authentication_enabled = true
}

# failure
# ruleid: aws-rds-cluster-iam-authentication-not-enabled
resource "aws_rds_cluster" "default" {
  master_username         = "username"
  master_password         = "password"
}
# ruleid: aws-rds-cluster-iam-authentication-not-enabled
resource "aws_rds_cluster" "disabled" {
  master_username         = "username"
  master_password         = "password"

  iam_database_authentication_enabled = false
}
