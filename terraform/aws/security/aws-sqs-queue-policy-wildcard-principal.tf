resource "aws_sqs_queue_policy" "fail_1_json" {
  queue_url = aws_sqs_queue.example.id
  # ruleid: aws-sqs-queue-policy-wildcard-principal
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::111122223333:root"
      },
      "Action": "sqs:*"
    },
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": [
        "sqs:SendMessage",
        "sqs:SendMessageBatch"
      ]
    }
  ]
}
POLICY
}

resource "aws_sqs_queue_policy" "fail_1_hcl" {
  queue_url = aws_sqs_queue.example.id
  policy = jsonencode(
    {
      Version = "2012-10-17",
      Statement = [
        {
          Effect = "Allow"
          Principal = {
            AWS = "arn:aws:iam::111122223333:root"
          }
          Action = "sqs:*"
        },
        # ruleid: aws-sqs-queue-policy-wildcard-principal
        {
          Effect = "Allow"
          Principal = {
            AWS = "*"
          }
          Action = [
            "sqs:SendMessage",
            "sqs:SendMessageBatch"
          ]
        }
      ]
  })
}

resource "aws_sqs_queue_policy" "fail_2_json" {
  queue_url = aws_sqs_queue.example.id
  # ruleid: aws-sqs-queue-policy-wildcard-principal
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": ["foo","*"],
      "Action": [
        "sqs:SendMessage",
        "sqs:SendMessageBatch"
      ]
    }
  ]
}
POLICY
}

resource "aws_sqs_queue_policy" "fail_2_hcl" {
  queue_url = aws_sqs_queue.example.id
  policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        # ruleid: aws-sqs-queue-policy-wildcard-principal
        {
          Effect    = "Allow"
          Principal = ["foo", "*"]
          Action = [
            "sqs:SendMessage",
            "sqs:SendMessageBatch"
          ]
        }
      ]
    }
  )
}

resource "aws_sqs_queue_policy" "fail_3_json" {
  queue_url = aws_sqs_queue.example.id
  # ruleid: aws-sqs-queue-policy-wildcard-principal
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "sqs:SendMessage",
        "sqs:SendMessageBatch"
      ]
    }
  ]
}
POLICY
}

resource "aws_sqs_queue_policy" "fail_3_hcl" {
  queue_url = aws_sqs_queue.example.id
  policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        # ruleid: aws-sqs-queue-policy-wildcard-principal
        {
          Effect    = "Allow"
          Principal = "*"
          Action = [
            "sqs:SendMessage",
            "sqs:SendMessageBatch"
          ]
        }
      ]
  })
}

resource "aws_sqs_queue_policy" "fail_4_json" {
  queue_url = aws_sqs_queue.example.id
  # ruleid: aws-sqs-queue-policy-wildcard-principal
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
        "sqs:SendMessage",
        "sqs:SendMessageBatch"
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
        "sqs:SendMessage",
        "sqs:SendMessageBatch"
      ]
    }
  ]
}
POLICY
}

resource "aws_sqs_queue_policy" "fail_4_hcl" {
  queue_url = aws_sqs_queue.example.id
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
            "sqs:SendMessage",
            "sqs:SendMessageBatch"
          ]
        },
        # ruleid: aws-sqs-queue-policy-wildcard-principal
        {
          Effect = "Allow"
          Principal = {
            AWS = [
              "arn:aws:iam::111122223333:root",
              "*"
            ]
          }
          Action = [
            "sqs:SendMessage",
            "sqs:SendMessageBatch"
          ]
        }
      ]
  })
}

resource "aws_sqs_queue" "fail_5_json" {
  # ruleid: aws-sqs-queue-policy-wildcard-principal
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::111122223333:root"
      },
      "Action": "sqs:*"
    },
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": [
        "sqs:SendMessage",
        "sqs:SendMessageBatch"
      ]
    }
  ]
}
POLICY
}

resource "aws_sqs_queue" "fail_5_hcl" {
  policy = jsonencode(
    {
      Version = "2012-10-17",
      Statement = [
        {
          Effect = "Allow"
          Principal = {
            AWS = "arn:aws:iam::111122223333:root"
          }
          Action = "sqs:*"
        },
        # ruleid: aws-sqs-queue-policy-wildcard-principal
        {
          Effect = "Allow"
          Principal = {
            AWS = "*"
          }
          Action = [
            "sqs:SendMessage",
            "sqs:SendMessageBatch"
          ]
        }
      ]
  })
}

resource "aws_sqs_queue" "fail_6_json" {
  # ruleid: aws-sqs-queue-policy-wildcard-principal
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": ["foo","*"],
      "Action": [
        "sqs:SendMessage",
        "sqs:SendMessageBatch"
      ]
    }
  ]
}
POLICY
}

resource "aws_sqs_queue" "fail_6_hcl" {
  policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        # ruleid: aws-sqs-queue-policy-wildcard-principal
        {
          Effect    = "Allow"
          Principal = ["foo", "*"]
          Action = [
            "sqs:SendMessage",
            "sqs:SendMessageBatch"
          ]
        }
      ]
    }
  )
}

resource "aws_sqs_queue" "fail_7_json" {
  # ruleid: aws-sqs-queue-policy-wildcard-principal
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "sqs:SendMessage",
        "sqs:SendMessageBatch"
      ]
    }
  ]
}
POLICY
}

resource "aws_sqs_queue" "fail_7_hcl" {
  policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        # ruleid: aws-sqs-queue-policy-wildcard-principal
        {
          Effect    = "Allow"
          Principal = "*"
          Action = [
            "sqs:SendMessage",
            "sqs:SendMessageBatch"
          ]
        }
      ]
  })
}

resource "aws_sqs_queue" "fail_8_json" {
  # ruleid: aws-sqs-queue-policy-wildcard-principal
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
        "sqs:SendMessage",
        "sqs:SendMessageBatch"
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
        "sqs:SendMessage",
        "sqs:SendMessageBatch"
      ]
    }
  ]
}
POLICY
}

resource "aws_sqs_queue" "fail_8_hcl" {
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
            "sqs:SendMessage",
            "sqs:SendMessageBatch"
          ]
        },
        # ruleid: aws-sqs-queue-policy-wildcard-principal
        {
          Effect = "Allow"
          Principal = {
            AWS = [
              "arn:aws:iam::111122223333:root",
              "*"
            ]
          }
          Action = [
            "sqs:SendMessage",
            "sqs:SendMessageBatch"
          ]
        }
      ]
  })
}

resource "aws_sqs_queue_policy" "pass_1_json" {
  queue_url = aws_sqs_queue.example.id
  # ok: aws-sqs-queue-policy-wildcard-principal
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
        "sqs:SendMessage",
        "sqs:SendMessageBatch"
      ]
    }
  ]
}
POLICY
}

resource "aws_sqs_queue_policy" "pass_1_hcl" {
  queue_url = aws_sqs_queue.example.id
  policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        # ok: aws-sqs-queue-policy-wildcard-principal
        {
          Effect = "Allow"
          Principal = {
            AWS = "arn:aws:iam::111122223333:root"
          }
          Action = [
            "sqs:SendMessage",
            "sqs:SendMessageBatch"
          ]
        }
      ]
    }
  )
}

resource "aws_sqs_queue_policy" "pass_2_json" {
  queue_url = aws_sqs_queue.example.id
  # ok: aws-sqs-queue-policy-wildcard-principal
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
        "sqs:SendMessage",
        "sqs:SendMessageBatch"
      ]
    }
  ]
}
POLICY
}

resource "aws_sqs_queue_policy" "pass_2_hcl" {
  queue_url = aws_sqs_queue.example.id
  policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        # ok: aws-sqs-queue-policy-wildcard-principal
        {
          Effect = "Deny"
          Principal = {
            AWS = "*"
          }
          Action = [
            "sqs:SendMessage",
            "sqs:SendMessageBatch"
          ]
        }
      ]
  })
}

resource "aws_sqs_queue_policy" "pass_3_json" {
  queue_url = aws_sqs_queue.example.id
  # ok: aws-sqs-queue-policy-wildcard-principal
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "foo",
      "Action": [
        "sqs:SendMessage",
        "sqs:SendMessageBatch"
      ]
    }
  ]
}
POLICY
}

resource "aws_sqs_queue_policy" "pass_3_hcl" {
  queue_url = aws_sqs_queue.example.id
  policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        # ok: aws-sqs-queue-policy-wildcard-principal
        {
          Effect    = "Allow"
          Principal = "foo"
          Action = [
            "sqs:SendMessage",
            "sqs:SendMessageBatch"
          ]
        }
      ]
    }
  )
}

resource "aws_sqs_queue_policy" "pass_4_json" {
  queue_url = aws_sqs_queue.example.id
  # ok: aws-sqs-queue-policy-wildcard-principal
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": ["foo","bar"],
      "Action": [
        "sqs:SendMessage",
        "sqs:SendMessageBatch"
      ]
    }
  ]
}
POLICY
}

resource "aws_sqs_queue_policy" "pass_4_hcl" {
  queue_url = aws_sqs_queue.example.id
  policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        # ok: aws-sqs-queue-policy-wildcard-principal
        {
          Effect    = "Allow"
          Principal = ["foo", "bar"]
          Action = [
            "sqs:SendMessage",
            "sqs:SendMessageBatch"
          ]
        }
      ]
  })
}

resource "aws_sqs_queue" "pass_5_json" {
  # ok: aws-sqs-queue-policy-wildcard-principal
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
        "sqs:SendMessage",
        "sqs:SendMessageBatch"
      ]
    }
  ]
}
POLICY
}

resource "aws_sqs_queue" "pass_5_hcl" {
  policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        # ok: aws-sqs-queue-policy-wildcard-principal
        {
          Effect = "Allow"
          Principal = {
            AWS = "arn:aws:iam::111122223333:root"
          }
          Action = [
            "sqs:SendMessage",
            "sqs:SendMessageBatch"
          ]
        }
      ]
    }
  )
}

resource "aws_sqs_queue" "pass_6_json" {
  # ok: aws-sqs-queue-policy-wildcard-principal
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
        "sqs:SendMessage",
        "sqs:SendMessageBatch"
      ]
    }
  ]
}
POLICY
}

resource "aws_sqs_queue" "pass_6_hcl" {
  policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        # ok: aws-sqs-queue-policy-wildcard-principal
        {
          Effect = "Deny"
          Principal = {
            AWS = "*"
          }
          Action = [
            "sqs:SendMessage",
            "sqs:SendMessageBatch"
          ]
        }
      ]
  })
}

resource "aws_sqs_queue" "pass_7_json" {
  # ok: aws-sqs-queue-policy-wildcard-principal
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "foo",
      "Action": [
        "sqs:SendMessage",
        "sqs:SendMessageBatch"
      ]
    }
  ]
}
POLICY
}

resource "aws_sqs_queue" "pass_7_hcl" {
  policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        # ok: aws-sqs-queue-policy-wildcard-principal
        {
          Effect    = "Allow"
          Principal = "foo"
          Action = [
            "sqs:SendMessage",
            "sqs:SendMessageBatch"
          ]
        }
      ]
    }
  )
}

resource "aws_sqs_queue" "pass_8_json" {
  # ok: aws-sqs-queue-policy-wildcard-principal
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": ["foo","bar"],
      "Action": [
        "sqs:SendMessage",
        "sqs:SendMessageBatch"
      ]
    }
  ]
}
POLICY
}

resource "aws_sqs_queue" "pass_8_hcl" {
  policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        # ok: aws-sqs-queue-policy-wildcard-principal
        {
          Effect    = "Allow"
          Principal = ["foo", "bar"]
          Action = [
            "sqs:SendMessage",
            "sqs:SendMessageBatch"
          ]
        }
      ]
  })
}
