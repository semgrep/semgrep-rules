resource "aws_iam_user_policy" "lb_ro" {
  name = "test"
  user = aws_iam_user.lb.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        # ok: no-iam-data-exfiltration
        Action = [
          "ssm:GetParameter*",
        ]
        Effect   = "Allow"
        Resource = "someResource"
      },
    ]
  })
}

data aws_iam_policy_document "policy" {
   statement {
     # ok: no-iam-data-exfiltration
     actions = ["rds:*"]
     principals {
       type        = "AWS"
       identifiers = ["*"]
     }
     resources = ["someResource"]
   }
}

resource "aws_iam_policy" "policy" {
  name        = "test_policy"
  path        = "/"
  description = "My test policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        # ruleid: no-iam-data-exfiltration
        Action = "secretsmanager:GetSecretValue"
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

data aws_iam_policy_document "policy" {
   statement {
     # ruleid: no-iam-data-exfiltration
     actions = ["ssm:*"]
     principals {
       type        = "AWS"
       identifiers = ["*"]
     }
     resources = ["*"]
   }
}
