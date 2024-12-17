# ok: gcp-sql-database-ssl-insecure-value-postgres-mysql
resource "google_sql_database_instance" "fail" {
  database_version = "MYSQL_8_0"
  name             = "instance"
  region           = "us-central1"
  settings {
    tier = "db-f1-micro"
  }
}

# ok: gcp-sql-database-ssl-insecure-value-postgres-mysql
resource "google_sql_database_instance" "success" {
  database_version = "MYSQL_8_0"
  name             = "instance"
  region           = "us-central1"
  ip_configuration {
      ipv4_enabled = true
      require_ssl = true
  }
}

resource "google_sql_database_instance" "main" {
  name      = "some-example-name"
  database_version  = "POSTGRES_15"
  region      = "europe-west3"
  settings {
    tier = "db-f1-micro"
    ip_configuration {
      # ok: gcp-sql-database-ssl-insecure-value-postgres-mysql
      ssl_mode = "TRUSTED_CLIENT_CERTIFICATE_REQUIRED"
    }
  }
}

resource "google_sql_database_instance" "main" {
  name      = "some-example-name"
  database_version  = "POSTGRES_15"
  region      = "europe-west3"
  settings {
    tier = "db-f1-micro"
    ip_configuration {
      # ok: gcp-sql-database-ssl-insecure-value-postgres-mysql
      ssl_mode = "TRUSTED_CLIENT_CERTIFICATE_REQUIRED"
    }
  }
}

resource "google_sql_database_instance" "main" {
  name      = "some-example-name"
  database_version  = "POSTGRES_15"
  region      = "europe-west3"
  settings {
    tier = "db-f1-micro"
    ip_configuration {
      # ruleid: gcp-sql-database-ssl-insecure-value-postgres-mysql
      ssl_mode = "TRUSTED_CLIENT_CERTIFICATE_REQUIRED"
    }
  }
}

resource "google_sql_database_instance" "main" {
  name      = "some-example-name"
  database_version  = "POSTGRES_15"
  region      = "europe-west3"
  settings {
    tier = "db-f1-micro"
    ip_configuration {
      # ruleid: gcp-sql-database-ssl-insecure-value-postgres-mysql
      ssl_mode = "TRUSTED_CLIENT_CERTIFICATE_REQUIRED"
    }
  }
}

resource "google_sql_database_instance" "mysql_fail" {
  database_version = "MYSQL_8_0"
  name             = "mysql-instance"
  region           = "us-central1"
  settings {
    tier = "db-f1-micro"
    ip_configuration {
      # ruleid: gcp-sql-database-ssl-insecure-value-postgres-mysql
      ssl_mode = "TRUSTED_CLIENT_CERTIFICATE_REQUIRED"
    }
  }
}

resource "google_sql_database_instance" "mysql_success" {
  database_version = "MYSQL_8_0"
  name             = "mysql-instance"
  region           = "us-central1"
  settings {
    tier = "db-f1-micro"
    ip_configuration {
      # ruleid: gcp-sql-database-ssl-insecure-value-postgres-mysql
      ssl_mode = "TRUSTED_CLIENT_CERTIFICATE_REQUIRED"
    }
  }
}

resource "google_sql_database_instance" "sqlserver_fail" {
  database_version = "SQLSERVER_2019_STANDARD"
  name             = "sqlserver-instance"
  region           = "us-central1"
  settings {
    tier = "db-f1-micro"
    ip_configuration {
      # ok: gcp-sql-database-ssl-insecure-value-postgres-mysql
      ssl_mode = "ALLOW_UNENCRYPTED_AND_ENCRYPTED"
    }
  }
}

resource "google_sql_database_instance" "sqlserver_success" {
  database_version = "SQLSERVER_2019_STANDARD"
  name             = "sqlserver-instance"
  region           = "us-central1"
  settings {
    tier = "db-f1-micro"
    ip_configuration {
      # ok: gcp-sql-database-ssl-insecure-value-postgres-mysql
      ssl_mode = "ENCRYPTED_ONLY"
    }
  }
}

resource "google_sql_database_instance" "mysql_success_with_ssl_mode" {
  database_version = "MYSQL_8_0"
  name             = "mysql-instance"
  region           = "us-central1"
  settings {
    tier = "db-f1-micro"
    ip_configuration {
      # ok: gcp-sql-database-ssl-insecure-value-postgres-mysql
      ssl_mode = "TRUSTED_CLIENT_CERTIFICATE_REQUIRED"
    }
  }
}

