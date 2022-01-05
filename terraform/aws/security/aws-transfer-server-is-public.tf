# fail
# ruleid: aws-transfer-server-is-public
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
# ruleid: aws-transfer-server-is-public
resource "aws_transfer_server" "example" {
    protocols   = ["SFTP"]
}