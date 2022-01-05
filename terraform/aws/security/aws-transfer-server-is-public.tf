# fail
<<<<<<< HEAD
# ruleid: aws-transfer-server-is-public
=======
>>>>>>> refs/remotes/origin/migrated-checkov-rules
resource "aws_transfer_server" "example_public" {
    endpoint_type = "PUBLIC"
    protocols   = ["SFTP"]
}

# pass
resource "aws_transfer_server" "example_vpc" {
    endpoint_type = "VPC"
    protocols   = ["SFTP"]
}

# fail
<<<<<<< HEAD
# ruleid: aws-transfer-server-is-public
=======
>>>>>>> refs/remotes/origin/migrated-checkov-rules
resource "aws_transfer_server" "example" {
    protocols   = ["SFTP"]
}