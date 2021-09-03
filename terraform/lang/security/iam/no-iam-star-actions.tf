resource "aws_iam_user_policy" "lb_ro" {
  name = "test"
  user = aws_iam_user.lb.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        # ok: no-iam-star-actions
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
     # ok: no-iam-star-actions
     actions = ["ec2:Describe"]
     principals {
       type        = "AWS"
       identifiers = ["*"]
     }
     resources = ["*"]
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
        #ruleid: no-iam-star-actions
        Action = "*"
        Effect   = "Allow"
        Resource = "s3"
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
        #ruleid: no-iam-star-actions
        Action = ["*"]
        Effect   = "Allow"
        Resource = "s3"
      },
    ]
  })
}

data aws_iam_policy_document "policy" {
   statement {
     # ruleid: no-iam-star-actions
     actions = ["*"]
     principals {
       type        = "AWS"
       identifiers = ["*"]
     }
     resources = ["someResource"]
   }
}
