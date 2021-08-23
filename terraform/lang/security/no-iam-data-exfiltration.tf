data "aws_iam_policy_document" "example" {
  // ruleid: no-iam-data-exfiltration
  statement {
    actions = [
        "lambda:CreateFunction",
        "ssm:GetParameter*",
        "dynamodb:CreateTable",
    ]
    resources = ["*"]
    effect = "Allow"
  }
  // ruleid: no-iam-data-exfiltration
  statement {
    actions = [
        "lambda:CreateEventSourceMapping",
        "secretsmanager:GetSecretValue",
        "dynamodb:CreateTable",
    ]
    resources = ["*"]
    effect = "Allow"
  }
  // ok: no-iam-data-exfiltration
  statement {
    actions   = ["s3:*"]
    resources = [aws_s3_bucket.bucket.arn]
    effect = "Allow"
  }
}
