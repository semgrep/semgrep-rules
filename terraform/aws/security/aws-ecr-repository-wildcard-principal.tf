resource "aws_ecr_repository_policy" "fail_1_json" {
  repository = aws_ecr_repository.example.name
  # ruleid: aws-ecr-repository-wildcard-principal
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::111122223333:root"
      },
      "Action": "ecr:*"
    },
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage"
      ]
    }
  ]
}
POLICY
}

resource "aws_ecr_repository_policy" "fail_1_hcl" {
  repository = aws_ecr_repository.example.name
  policy = jsonencode(
    {
      Version = "2012-10-17",
      Statement = [
        {
          Effect = "Allow"
          Principal = {
            AWS = "arn:aws:iam::111122223333:root"
          }
          Action = "ecr:*"
        },
        # ruleid: aws-ecr-repository-wildcard-principal
        {
          Effect = "Allow"
          Principal = {
            AWS = "*"
          }
          Action = [
            "ecr:GetDownloadUrlForLayer",
            "ecr:BatchGetImage"
          ]
        }
      ]
  })
}

resource "aws_ecr_repository_policy" "fail_2_json" {
  repository = aws_ecr_repository.example.name
  # ruleid: aws-ecr-repository-wildcard-principal
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": ["foo","*"],
      "Action": [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage"
      ]
    }
  ]
}
POLICY
}

resource "aws_ecr_repository_policy" "fail_2_hcl" {
  repository = aws_ecr_repository.example.name
  policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        # ruleid: aws-ecr-repository-wildcard-principal
        {
          Effect    = "Allow"
          Principal = ["foo", "*"]
          Action = [
            "ecr:GetDownloadUrlForLayer",
            "ecr:BatchGetImage"
          ]
        }
      ]
    }
  )
}

resource "aws_ecr_repository_policy" "fail_3_json" {
  repository = aws_ecr_repository.example.name
  # ruleid: aws-ecr-repository-wildcard-principal
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage"
      ]
    }
  ]
}
POLICY
}

resource "aws_ecr_repository_policy" "fail_3_hcl" {
  repository = aws_ecr_repository.example.name
  policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        # ruleid: aws-ecr-repository-wildcard-principal
        {
          Effect    = "Allow"
          Principal = "*"
          Action = [
            "ecr:GetDownloadUrlForLayer",
            "ecr:BatchGetImage"
          ]
        }
      ]
  })
}

resource "aws_ecr_repository_policy" "fail_4_json" {
  repository = aws_ecr_repository.example.name
  # ruleid: aws-ecr-repository-wildcard-principal
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::111122223333:root"
      },
      "Action": [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage"
      ]
    },
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "arn:aws:iam::111122223333:root",
          "*"
        ]
      },
      "Action": [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage"
      ]
    }
  ]
}
POLICY
}

resource "aws_ecr_repository_policy" "fail_4_hcl" {
  repository = aws_ecr_repository.example.name
  policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        {
          Effect = "Allow"
          Principal = {
            AWS = "arn:aws:iam::111122223333:root"
          }
          Action = [
            "ecr:GetDownloadUrlForLayer",
            "ecr:BatchGetImage"
          ]
        },
        # ruleid: aws-ecr-repository-wildcard-principal
        {
          Effect = "Allow"
          Principal = {
            AWS = [
              "arn:aws:iam::111122223333:root",
              "*"
            ]
          }
          Action = [
            "ecr:GetDownloadUrlForLayer",
            "ecr:BatchGetImage"
          ]
        }
      ]
  })
}

resource "aws_ecr_repository_policy" "pass_1_json" {
  repository = aws_ecr_repository.example.name
  # ok: aws-ecr-repository-wildcard-principal
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::111122223333:root"
      },
      "Action": [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage"
      ]
    }
  ]
}
POLICY
}

resource "aws_ecr_repository_policy" "pass_1_hcl" {
  repository = aws_ecr_repository.example.name
  policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        # ok: aws-ecr-repository-wildcard-principal
        {
          Effect = "Allow"
          Principal = {
            AWS = "arn:aws:iam::111122223333:root"
          }
          Action = [
            "ecr:GetDownloadUrlForLayer",
            "ecr:BatchGetImage"
          ]
        }
      ]
    }
  )
}

resource "aws_ecr_repository_policy" "pass_2_json" {
  repository = aws_ecr_repository.example.name
  # ok: aws-ecr-repository-wildcard-principal
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Deny",
      "Principal": {
        "AWS": "*"
      },
      "Action": [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage"
      ]
    }
  ]
}
POLICY
}

resource "aws_ecr_repository_policy" "pass_2_hcl" {
  repository = aws_ecr_repository.example.name
  policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        # ok: aws-ecr-repository-wildcard-principal
        {
          Effect = "Deny"
          Principal = {
            AWS = "*"
          }
          Action = [
            "ecr:GetDownloadUrlForLayer",
            "ecr:BatchGetImage"
          ]
        }
      ]
  })
}

resource "aws_ecr_repository_policy" "pass_3_json" {
  repository = aws_ecr_repository.example.name
  # ok: aws-ecr-repository-wildcard-principal
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "foo",
      "Action": [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage"
      ]
    }
  ]
}
POLICY
}

resource "aws_ecr_repository_policy" "pass_3_hcl" {
  repository = aws_ecr_repository.example.name
  policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        # ok: aws-ecr-repository-wildcard-principal
        {
          Effect    = "Allow"
          Principal = "foo"
          Action = [
            "ecr:GetDownloadUrlForLayer",
            "ecr:BatchGetImage"
          ]
        }
      ]
    }
  )
}

resource "aws_ecr_repository_policy" "pass_4_json" {
  repository = aws_ecr_repository.example.name
  # ok: aws-ecr-repository-wildcard-principal
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": ["foo","bar"],
      "Action": [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage"
      ]
    }
  ]
}
POLICY
}

resource "aws_ecr_repository_policy" "pass_4_hcl" {
  repository = aws_ecr_repository.example.name
  policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        # ok: aws-ecr-repository-wildcard-principal
        {
          Effect    = "Allow"
          Principal = ["foo", "bar"]
          Action = [
            "ecr:GetDownloadUrlForLayer",
            "ecr:BatchGetImage"
          ]
        }
      ]
  })
}
