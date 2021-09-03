resource "aws_iam_user_policy" "lb_ro" {
  name = "test"
  user = aws_iam_user.lb.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        # ok: no-iam-resource-exposure
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_group_policy" "policy" {
  name        = "test_policy"
  path        = "/"
  description = "My test policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        # ruleid: no-iam-resource-exposure
        Action = "backup:DeleteBackupVaultAccessPolicy"
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
        # ruleid: no-iam-resource-exposure
        Action = ["ecr:SetRepositoryPolicy"]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

data aws_iam_policy_document "policy" {
   statement {
     # ruleid: no-iam-resource-exposure
     actions = ["es:*"]
     principals {
       type        = "AWS"
       identifiers = ["*"]
     }
     resources = ["*"]
   }
}
