data "aws_iam_policy_document" "example" {
  // ruleid: no-iam-admin-privileges
  statement {
    actions   = ["*"]
    resources = ["*"]
    effect = "Allow"
  }
  // ok: no-iam-admin-privileges
  statement {
    actions   = ["s3:*"]
    resources = [aws_s3_bucket.bucket.arn]
    effect = "Allow"
  }
}
