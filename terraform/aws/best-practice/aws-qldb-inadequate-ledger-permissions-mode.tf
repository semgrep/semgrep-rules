# pass

resource "aws_qldb_ledger" "standard" {
  name             = "ledger"
  permissions_mode = "STANDARD"
}

# failure
<<<<<<< HEAD
# ruleid: aws-qldb-inadequate-ledger-permissions-mode
=======

>>>>>>> refs/remotes/origin/migrated-checkov-rules
resource "aws_qldb_ledger" "allow_all" {
  name             = "ledger"
  permissions_mode = "ALLOW_ALL"
}
