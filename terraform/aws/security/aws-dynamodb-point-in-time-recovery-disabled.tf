# ok: aws-dynamodb-point-in-time-recovery-disabled
resource "aws_dynamodb_table" "pass" {
  name     = "example"
  hash_key = "ExampleHashKey"

  attribute {
    name = "ExampleHashKey"
    type = "S"
  }

  point_in_time_recovery {
    enabled = true
  }
}

# ruleid: aws-dynamodb-point-in-time-recovery-disabled
resource "aws_dynamodb_table" "fail_1" {
  name     = "example"
  hash_key = "ExampleHashKey"

  attribute {
    name = "ExampleHashKey"
    type = "S"
  }
}

# ruleid: aws-dynamodb-point-in-time-recovery-disabled
resource "aws_dynamodb_table" "fail_2" {
  name     = "example"
  hash_key = "ExampleHashKey"

  attribute {
    name = "ExampleHashKey"
    type = "S"
  }

  point_in_time_recovery {
    enabled = false
  }
}
