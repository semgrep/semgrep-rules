resource "aws_rds_cluster" "pass" {
  backup_retention_period = 35
}

resource "aws_rds_cluster" "pass2" {
}
<<<<<<< HEAD
# ruleid: aws-rds-backup-no-retention
=======

>>>>>>> refs/remotes/origin/migrated-checkov-rules
resource "aws_rds_cluster" "fail2" {
  backup_retention_period = 0
}

<<<<<<< HEAD
=======
#this will fail in tf i dont know why we even bother?
resource "aws_rds_cluster" "fail" {
  backup_retention_period = 36
}

>>>>>>> refs/remotes/origin/migrated-checkov-rules
resource "aws_db_instance" "pass" {
  backup_retention_period = 35
}

resource "aws_db_instance" "pass2" {
}
<<<<<<< HEAD
# ruleid: aws-rds-backup-no-retention
resource "aws_db_instance" "fail" {
  backup_retention_period = 0
}
=======

resource "aws_db_instance" "fail2" {
  backup_retention_period = 0
}

#this will fail in tf i dont know why we even bother?
resource "aws_db_instance" "fail" {
  backup_retention_period = 36
}
>>>>>>> refs/remotes/origin/migrated-checkov-rules
