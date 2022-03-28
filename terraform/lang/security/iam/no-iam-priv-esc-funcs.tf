resource "aws_iam_user_policy" "lb_ro" {
  name = "test"
  user = aws_iam_user.lb.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        # ok: no-iam-priv-esc-funcs
        Action = [
          "std:AssumeRole",
        ]
        Effect   = "Allow"
        Resource = ["arn:aws:iam::ACCOUNT-ID-WITHOUT-HYPHENS:user/${aws.username}"]
      },
    ]
  })
}

resource "aws_iam_policy" "lb_ro" {
  name = "test"
  user = aws_iam_user.lb.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        # ok: no-iam-priv-esc-funcs
        Action = [
          "ec2:Describe",
        ]
        Effect   = "Allow"
        Resource = ["*"]
      },
    ]
  })
}

data aws_iam_policy_document "policy" {
   statement {
     # ok: no-iam-priv-esc-funcs
     actions = ["ec2:Describe"]
     principals {
       type        = "AWS"
       identifiers = ["*"]
     }
     resources = ["*"]
   }
}

resource "aws_iam_user_policy" "policy" {
  name        = "test_policy"
  path        = "/"
  description = "My test policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        # ruleid: no-iam-priv-esc-funcs
        Action = "iam:PutGroupPolicy"
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
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
        # ruleid: no-iam-priv-esc-funcs
        Action = ["iam:PutUserPolicy", "ec2:Describe"]
        Effect   = "Allow"
        Resource = "arn:aws:iam::*:user/*"
      },
    ]
  })
}

data aws_iam_policy_document "policy" {
   statement {
     # ruleid: no-iam-priv-esc-funcs
     actions = ["glue:*"]
     principals {
       type        = "AWS"
       identifiers = ["*"]
     }
     resources = ["*"]
   }
}
