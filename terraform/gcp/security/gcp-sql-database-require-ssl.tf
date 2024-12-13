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

# ok: gcp-sql-database-require-ssl
resource "google_sql_database_instance" "main" {
  name      = "some-example-name"
  database_version  = "POSTGRES_15"
  region      = "europe-west3"
  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ssl_mode = "TRUSTED_CLIENT_CERTIFICATE_REQUIRED"
    }
  }
}
