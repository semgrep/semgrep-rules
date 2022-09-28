# fail
# ruleid: gcp-sql-database-require-ssl
resource "google_sql_database_instance" "fail" {
  database_version = "MYSQL_8_0"
  name             = "instance"
  region           = "us-central1"
  settings {
    tier = "db-f1-micro"
  }
}

# ok: gcp-sql-database-require-ssl
resource "google_sql_database_instance" "success" {
  database_version = "MYSQL_8_0"
  name             = "instance"
  region           = "us-central1"
  ip_configuration {
      ipv4_enabled = true
      require_ssl = true
  }
}