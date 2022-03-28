resource "aws_iam_user_policy" "lb_ro" {
  name = "test"
  user = aws_iam_user.lb.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        # ok: no-iam-admin-privileges
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

data aws_iam_policy_document "policy" {
   statement {
     # ok: no-iam-admin-privileges
     actions = ["*"]
     principals {
       type        = "AWS"
       identifiers = ["*"]
     }
     effect = "Deny"
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
        #ok: no-iam-admin-privileges
        Resource = "*"
        Action = "*"
        Effect = "Deny"
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
      #ruleid: no-iam-admin-privileges
      {
        Resource = "*"
        Action = "*"
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
      #ruleid: no-iam-admin-privileges
      {
        Action = "*"
        Effect = "Allow"
        Resource = "*"
      },
    ]
  })
}

data aws_iam_policy_document "policy" {
   #ruleid: no-iam-admin-privileges
   statement {
     resources = ["*"]
     actions = ["*"]
     principals {
       type        = "AWS"
       identifiers = ["*"]
     }
   }
}
