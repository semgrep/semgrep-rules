# fail
# ruleid: gcp-gke-sql-backup-configuration-enabled
resource "google_sql_database_instance" "fail" {
  database_version = "MYSQL_8_0"
  name             = "instance"
  region           = "us-central1"
  settings {
    tier = "db-f1-micro"
  }
}

# ok: gcp-gke-sql-backup-configuration-enabled
resource "google_sql_database_instance" "success" {
  database_version = "MYSQL_8_0"
  name             = "instance"
  region           = "us-central1"
  settings {
    tier = "db-f1-micro"
    backup_configuration {
        enabled = true
        start_time = "17:00"
    }
  }
}