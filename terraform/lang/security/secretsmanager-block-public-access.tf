resource "aws_secretsmanager_secret" "example" {
  name = "example"
}


# ok: secretsmanager-block-public-access
resource "aws_secretsmanager_secret_policy" "ok" {
  secret_arn          = aws_secretsmanager_secret.example.arn
  policy              = "policy"
  block_public_policy = true
}

# ruleid: secretsmanager-block-public-access
resource "aws_secretsmanager_secret_policy" "block_public_access_false" {
  secret_arn          = aws_secretsmanager_secret.example.arn
  policy              = "policy"
  block_public_policy = false
}

# ruleid: secretsmanager-block-public-access
resource "aws_secretsmanager_secret_policy" "insecure_defaults" {
  secret_arn          = aws_secretsmanager_secret.example.arn
  policy              = "policy"
}