# pass

resource "aws_timestreamwrite_database" "enabled" {
  database_name = "timestream"

  kms_key_id = var.kms_key_id
}

# failure
<<<<<<< HEAD
# ruleid: aws-timestream-database-encrypted-with-cmk
=======

>>>>>>> refs/remotes/origin/migrated-checkov-rules
resource "aws_timestreamwrite_database" "default" {
  database_name = "timestream"
}
