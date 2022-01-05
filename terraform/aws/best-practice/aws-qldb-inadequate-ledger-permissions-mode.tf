# pass

resource "aws_qldb_ledger" "standard" {
  name             = "ledger"
  permissions_mode = "STANDARD"
}

# failure
# ruleid: aws-qldb-inadequate-ledger-permissions-mode
resource "aws_qldb_ledger" "allow_all" {
  name             = "ledger"
  permissions_mode = "ALLOW_ALL"
}
