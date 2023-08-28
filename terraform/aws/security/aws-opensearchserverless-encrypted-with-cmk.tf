resource "aws_opensearchserverless_security_policy" "fail" {
  name        = "fail"
  type        = "encryption"
  description = "encryption security policy for example-collection"
  # ruleid: aws-opensearchserverless-encrypted-with-cmk
  policy = jsonencode({
    Rules = [
      {
        Resource = [
          "collection/example-collection"
        ],
        ResourceType = "collection"
      }
    ],
    AWSOwnedKey = true
  })
}

resource "aws_opensearchserverless_security_policy" "fail_2_heredoc" {
  name        = "fail_2_heredoc"
  type        = "encryption"
  description = "encryption security policy with heredoc"
  # ruleid: aws-opensearchserverless-encrypted-with-cmk
  policy = <<POLICY
{
   "Rules": [
      {
         "Resource": [
            "collection/example-collection"
         ],
         "ResourceType": "collection"
      }
   ],
   "AWSOwnedKey": true
}
POLICY
}

resource "aws_opensearchserverless_security_policy" "pass" {
  name        = "pass"
  type        = "encryption"
  description = "encryption security policy using customer KMS key"
  # ok: aws-opensearchserverless-encrypted-with-cmk
  policy = jsonencode({
    Rules = [
      {
        Resource = [
          "collection/customer-managed-key-collection"
        ],
        ResourceType = "collection"
      }
    ],
    AWSOwnedKey = false
    KmsARN      = "arn:aws:kms:us-east-1:123456789012:key/93fd6da4-a317-4c17-bfe9-382b5d988b36"
  })
}

# pass because this is a network policy and not encryption type policy
resource "aws_opensearchserverless_security_policy" "pass2" {
  name        = "pass2"
  type        = "network"
  description = "Public access"
  # ok: aws-opensearchserverless-encrypted-with-cmk
  policy = jsonencode([
    {
      Description = "Public access to collection and Dashboards endpoint for example collection",
      Rules = [
        {
          ResourceType = "collection",
          Resource = [
            "collection/example-collection"
          ]
        },
        {
          ResourceType = "dashboard"
          Resource = [
            "collection/example-collection"
          ]
        }
      ],
      AllowFromPublic = true
    }
  ])
}
