# pass

resource "aws_timestreamwrite_database" "enabled" {
  database_name = "timestream"

  kms_key_id = var.kms_key_id
}

# failure
# ruleid: aws-timestream-database-encrypted-with-cmk
resource "aws_timestreamwrite_database" "default" {
  database_name = "timestream"
}
