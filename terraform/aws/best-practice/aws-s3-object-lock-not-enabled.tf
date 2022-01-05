# pass

resource "aws_s3_bucket" "enabled_via_object" {
  bucket = "test-bucket"
  acl    = "private"

  object_lock_configuration = {
    object_lock_enabled = "Enabled"
  }
}

resource "aws_s3_bucket" "enabled_via_block" {
  bucket = "test-bucket"
  acl    = "private"

  object_lock_configuration {
    object_lock_enabled = "Enabled"
  }
}

# failure
<<<<<<< HEAD
# ruleid: aws-s3-object-lock-not-enabled
=======

>>>>>>> refs/remotes/origin/migrated-checkov-rules
resource "aws_s3_bucket" "disabled_via_object" {
  bucket = "test-bucket"
  acl    = "private"

  object_lock_configuration = {
    object_lock_enabled = "Disabled"
  }
}
<<<<<<< HEAD
# ruleid: aws-s3-object-lock-not-enabled
=======

>>>>>>> refs/remotes/origin/migrated-checkov-rules
resource "aws_s3_bucket" "disabled_via_block" {
  bucket = "test-bucket"
  acl    = "private"

  object_lock_configuration {
    object_lock_enabled = "Disabled"
  }
}

# unknown

resource "aws_s3_bucket" "default" {
  bucket = "test-bucket"
  acl    = "private"
}
