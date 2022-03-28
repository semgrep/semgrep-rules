resource "aws_rds_cluster" "pass" {
  backup_retention_period = 35
}

resource "aws_rds_cluster" "pass2" {
}
# ruleid: aws-rds-backup-no-retention
resource "aws_rds_cluster" "fail2" {
  backup_retention_period = 0
}

resource "aws_db_instance" "pass" {
  backup_retention_period = 35
}

resource "aws_db_instance" "pass2" {
}
# ruleid: aws-rds-backup-no-retention
resource "aws_db_instance" "fail" {
  backup_retention_period = 0
}
