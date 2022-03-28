resource "aws_iam_role" "bad" {
  name = var.role_name
  # ruleid: wildcard-assume-role
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "sts:AssumeRole",
      "Condition": {}
    }
  ]
}
POLICY
}

resource "aws_iam_role" "ok" {
  name = var.role_name
  # ok: wildcard-assume-role
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root",
      "Condition": {}
    }
  ]
}
POLICY
}
