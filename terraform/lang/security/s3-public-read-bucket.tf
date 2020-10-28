resource "aws_s3_bucket" "a" {
  bucket = "my-tf-test-bucket"
  # ruleid: s3-public-read-bucket
  acl    = "public-read"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "b" {
  bucket = "s3-website-test.hashicorp.com"
  # ok: s3-public-read-bucket
  acl    = "public-read"
  policy = file("policy.json")

  website {
    index_document = "index.html"
    error_document = "error.html"

    routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "docs/"
    },
    "Redirect": {
        "ReplaceKeyPrefixWith": "documents/"
    }
}]
EOF
  }
}
