resource "aws_opensearchserverless_security_policy" "example" {
  name        = "example"
  type        = "network"
  description = "Mixed access for marketing and sales"
  policy = jsonencode([
    {
      "Description" : "Marketing access",
      "Rules" : [
        {
          "ResourceType" : "collection",
          "Resource" : [
            "collection/marketing*"
          ]
        },
        {
          "ResourceType" : "dashboard",
          "Resource" : [
            "collection/marketing*"
          ]
        }
      ],
      "AllowFromPublic" : false,
      "SourceVPCEs" : [
        "vpce-050f79086ee71ac05"
      ]
    },
    # ruleid: aws-opensearchserverless-is-public
    {
      "Description" : "Sales access",
      "Rules" : [
        {
          "ResourceType" : "collection",
          "Resource" : [
            "collection/finance"
          ]
        }
      ],
      "AllowFromPublic" : true
    }
  ])
}

resource "aws_opensearchserverless_security_policy" "pass" {
  name        = "example"
  type        = "network"
  description = "VPC access"
  policy = jsonencode(
    {
      Description = "VPC access to collection and Dashboards endpoint for example collection",
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
      # ok: aws-opensearchserverless-is-public
      AllowFromPublic = false,
      SourceVPCEs = [
        "vpce-050f79086ee71ac05"
      ]
    }
  )
}

resource "aws_opensearchserverless_security_policy" "fail_2_heredoc" {
  name        = "fail_2_heredoc"
  type        = "network"
  description = "public access"
  # ruleid: aws-opensearchserverless-is-public
  policy = <<POLICY
{
   "Rules": [
      {
         "Resource": [
            "collection/example-collection"
         ],
         "ResourceType": "collection"
      },
      {
         "Resource": [
            "collection/example-collection"
         ],
         "ResourceType": "dashboard"
      }
   ],
   "AllowFromPublic": true
}
POLICY
}
