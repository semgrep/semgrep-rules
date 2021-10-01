resource "aws_iam_user_policy" "lb_ro" {
  name = "test"
  user = aws_iam_user.lb.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        # ok: no-iam-priv-esc-roles
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
        # ok: no-iam-priv-esc-roles
        Action = [
          "datapipeline:CreatePipeline",
          "datapipeline:PutPipelineDefinition"
        ]
        Effect   = "Allow"
        Resource = ["*"]
      },
    ]
  })
}

data aws_iam_policy_document "policy" {
   statement {
     # ok: no-iam-priv-esc-roles
     actions = ["glue:CreateDevEndpoint"]
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
        # ruleid: no-iam-priv-esc-roles
        Action = ["lambda:CreateFunction", "lambda:CreateEventSourceMapping", "iam:PassRole"]
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
        # ruleid: no-iam-priv-esc-roles
        Action = ["ec2:Describe", "sts:AssumeRole", "ec2:Test", "iam:UpdateAssumeRolePolicy"]
        Effect   = "Allow"
        Resource = "arn:aws:iam::account:user/*"
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
        # ruleid: no-iam-priv-esc-roles
        Action = "lambda:UpdateFunctionCode"
        Effect   = "Allow"
        Resource = "arn:aws:iam::account:user/*"
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
        # ruleid: no-iam-priv-esc-roles
        Action = ["iam:UpdateAssumeRolePolicy", "sts:AssumeRole"]
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
        # ruleid: no-iam-priv-esc-roles
        Action = ["datapipeline:PutPipelineDefinition", "datapipeline:CreatePipeline", "iam:PassRole"]
        Effect   = "Allow"
        Resource = "arn:aws:iam::*:user/*"
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
        # ok: no-iam-priv-esc-roles
        Action = "datapipeline:CreatePipeline"
        Effect   = "Allow"
        Resource = "arn:aws:iam::*:user/*"
      },
    ]
  })
}

data aws_iam_policy_document "policy" {
   statement {
     # ruleid: no-iam-priv-esc-roles
     actions = ["cloudformation:CreateStack", "iam:PassRole"]
     principals {
       type        = "AWS"
       identifiers = ["*"]
     }
     resources = ["*"]
   }
}
