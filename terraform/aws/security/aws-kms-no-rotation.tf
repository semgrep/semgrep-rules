resource "aws_kms_key" "pass1" {
  description             = "KMS key 1"
  deletion_window_in_days = 10
  enable_key_rotation = true
}

resource "aws_kms_key" "pass2" {
  description             = "KMS key 1"
  deletion_window_in_days = 10
  customer_master_key_spec = "RSA_2096"
}

resource "aws_kms_key" "pass3" {
  description             = "KMS key 1"
  deletion_window_in_days = 10
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  enable_key_rotation = true
}
<<<<<<< HEAD
# ruleid: aws-kms-no-rotation
=======

>>>>>>> refs/remotes/origin/migrated-checkov-rules
resource "aws_kms_key" "fail1" {
  description             = "KMS key 1"
  deletion_window_in_days = 10
}
<<<<<<< HEAD
# ruleid: aws-kms-no-rotation
=======

>>>>>>> refs/remotes/origin/migrated-checkov-rules
resource "aws_kms_key" "fail2" {
  description             = "KMS key 1"
  deletion_window_in_days = 10
  enable_key_rotation = false
}
<<<<<<< HEAD
# ruleid: aws-kms-no-rotation
=======

>>>>>>> refs/remotes/origin/migrated-checkov-rules
resource "aws_kms_key" "fail3" {
  description             = "KMS key 1"
  deletion_window_in_days = 10
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  enable_key_rotation = false
}
<<<<<<< HEAD
# ruleid: aws-kms-no-rotation
=======

>>>>>>> refs/remotes/origin/migrated-checkov-rules
resource "aws_kms_key" "fail4" {
  description             = "KMS key 1"
  deletion_window_in_days = 10
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
}