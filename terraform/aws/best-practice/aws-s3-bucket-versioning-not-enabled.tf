# ruleid: aws-s3-bucket-versioning-not-enabled
resource "aws_s3_bucket" "fail4" {
  region        = "us-west-2"
  bucket        = "my_bucket"
  acl           = "public-read"
  force_destroy = true
  tags {
    Name = "my-bucket"
  }
}
# ruleid: aws-s3-bucket-versioning-not-enabled
resource "aws_s3_bucket" "fail3" {
  region        = "us-west-2"
  bucket        = "my_bucket"
  acl           = "public-read"
  force_destroy = true
  tags          = { Name = "my-bucket" }
  enabled       = True
}
# ruleid: aws-s3-bucket-versioning-not-enabled
resource "aws_s3_bucket" "fail2" {
  region        = "us-west-2"
  bucket        = "my_bucket"
  acl           = "public-read"
  force_destroy = true
  tags = {
    Name = "my-bucket"
    wrong_field = {
    enabled = true }
  }
}
# ruleid: aws-s3-bucket-versioning-not-enabled
resource "aws_s3_bucket" "fail" {
  region        = "us-west-2"
  bucket        = "my_bucket"
  acl           = "public-read"
  force_destroy = true
  tags          = { Name = "my-bucket" }
  wrong_field   = { versioning = { enabled = true } }
}


resource "aws_s3_bucket" "pass" {
  region        = "us-west-2"
  bucket        = "my_bucket"
  acl           = "public-read"
  force_destroy = true

  tags = { Name = "my-bucket" }

  logging {
    target_bucket = "logging-bucket"
    target_prefix = "log/"
  }
  versioning {
    enabled = true
  }
}
# ruleid: aws-s3-bucket-versioning-not-enabled
resource "aws_s3_bucket" "failcomplex" {
  acl    = "public-read-write"
  bucket = "superfail"

  versioning {
    enabled    = false
    mfa_delete = false
  }

  policy = <<POLICY
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Sid":"AddCannedAcl",
      "Effect":"Allow",
      "Principal": "*",
      "Action":["s3:PutObject","s3:PutObjectAcl"],
      "Resource":"arn:aws:s3:::superfail/*"
    },
    {
        "Principal": {
            "AWS": ["*"],
            "Effect": "Deny",
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "*"
            ]
        }
    }
  ]
}
POLICY
}

# todoruleid: aws-s3-bucket-versioning-not-enabled
resource "aws_s3_bucket" "this" {
  bucket = var.bucket
  acl    = "private"
  versioning {
    enabled = var.enabled
  }
}

variable "enabled" {
  default=true
}

# Separate versioning resource, as reported in #3497.
# ok: aws-s3-bucket-versioning-not-enabled
resource "aws_s3_bucket" "example" {
  bucket = "example-bucket"
}

# An intervening bucket must not inherit another bucket's versioning.
# ruleid: aws-s3-bucket-versioning-not-enabled
resource "aws_s3_bucket" "intervening_unversioned" {
  bucket = "intervening-unversioned"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Enabled versioning on example must not exempt a different bucket.
# ruleid: aws-s3-bucket-versioning-not-enabled
resource "aws_s3_bucket" "unversioned_neighbor" {
  bucket = "unversioned-neighbor"
}

# The versioning resource can precede the bucket declaration.
resource "aws_s3_bucket_versioning" "versioning_before" {
  bucket = aws_s3_bucket.declared_later.id
  versioning_configuration {
    status = "Enabled"
  }
}

# ok: aws-s3-bucket-versioning-not-enabled
resource "aws_s3_bucket" "declared_later" {
  bucket = "declared-later"
}

# Suspended versioning is not enabled.
# ruleid: aws-s3-bucket-versioning-not-enabled
resource "aws_s3_bucket" "suspended" {
  bucket = "suspended-bucket"
}

resource "aws_s3_bucket_versioning" "versioning_suspended" {
  bucket = aws_s3_bucket.suspended.id
  versioning_configuration {
    status = "Suspended"
  }
}

# A disabled status must not exempt the bucket.
# ruleid: aws-s3-bucket-versioning-not-enabled
resource "aws_s3_bucket" "disabled" {
  bucket = "disabled-bucket"
}

resource "aws_s3_bucket_versioning" "versioning_disabled" {
  bucket = aws_s3_bucket.disabled.id
  versioning_configuration {
    status = "Disabled"
  }
}

# A status at the wrong nesting level does not configure versioning.
# ruleid: aws-s3-bucket-versioning-not-enabled
resource "aws_s3_bucket" "wrong_status_field" {
  bucket = "wrong-status-field"
}

resource "aws_s3_bucket_versioning" "versioning_wrong_status" {
  bucket = aws_s3_bucket.wrong_status_field.id
  status = "Enabled"
}

# HCL also permits unquoted block labels.
# ruleid: aws-s3-bucket-versioning-not-enabled
resource "aws_s3_bucket" unquoted_unversioned {
  bucket = "unquoted-unversioned"
}

# Legacy inline versioning remains exempt.
# ok: aws-s3-bucket-versioning-not-enabled
resource "aws_s3_bucket" "inline_enabled" {
  bucket = "inline-enabled"
  versioning {
    enabled = true
  }
}

# Preserve the existing treatment of unknown inline versioning.
# ok: aws-s3-bucket-versioning-not-enabled
resource "aws_s3_bucket" "inline_unknown" {
  bucket = "inline-unknown"
  versioning {
    enabled = var.enabled
  }
}

# Direct references also work for unquoted bucket labels.
# ok: aws-s3-bucket-versioning-not-enabled
resource "aws_s3_bucket" unquoted_enabled {
  bucket = "unquoted-enabled"
}

resource "aws_s3_bucket_versioning" "versioning_unquoted" {
  bucket = aws_s3_bucket.unquoted_enabled.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_versioning" "versioning_unquoted_before" {
  bucket = aws_s3_bucket.unquoted_later.id
  versioning_configuration {
    status = "Enabled"
  }
}

# ok: aws-s3-bucket-versioning-not-enabled
resource "aws_s3_bucket" unquoted_later {
  bucket = "unquoted-later"
}
