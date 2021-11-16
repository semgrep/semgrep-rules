resource "aws_iam_user_policy" "lb_ro" {
  name = "test"
  user = aws_iam_user.lb.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        # ok: no-iam-priv-esc-other-users
        Action = [
          "iam:CreateAccessKey",
        ]
        Effect   = "Allow"
        Resource = ["arn:aws:iam::ACCOUNT-ID-WITHOUT-HYPHENS:user/${aws.username}"]
      },
    ]
  })
}

resource "aws_iam_user_policy" "lb_ro" {
  name = "test"
  user = aws_iam_user.lb.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        # ok: no-iam-priv-esc-other-users
        Action = [
          "iam:CreateAccessKey",
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
        # ok: no-iam-priv-esc-other-users
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
     # ok: no-iam-priv-esc-other-users
     actions = ["iam:*"]
     principals {
       type        = "AWS"
       identifiers = ["*"]
     }
     resources = ["arn:aws:iam::ACCOUNT-ID-WITHOUT-HYPHENS:user/${aws.username}"]
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
        # ruleid: no-iam-priv-esc-other-users
        Action = "iam:CreateLoginProfile"
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
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
        # ruleid: no-iam-priv-esc-other-users
        Action = "iam:CreateAccessKey"
        Effect   = "Allow"
        Resource = "arn:aws:iam::account:user/*"
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
        # ruleid: no-iam-priv-esc-other-users
        Action = ["iam:UpdateLoginProfile"]
        Effect   = "Allow"
        Resource = "arn:aws:iam::*:user/*"
      },
    ]
  })
}

data aws_iam_policy_document "policy" {
   statement {
     # ruleid: no-iam-priv-esc-other-users
     actions = ["iam:*"]
     principals {
       type        = "AWS"
       identifiers = ["*"]
     }
     resources = ["*"]
   }
}
