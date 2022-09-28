# fail
# ruleid: gcp-mysql-local-in-file-off
resource "google_sql_database_instance" "fail" {
  database_version = "MYSQL_8_0"
  name             = "mysql81"
  project          = "gcp-bridgecrew-deployment"
  region           = "us-central1"
  settings {
    activation_policy = "ALWAYS"
    tier              = "db-n1-standard-1"
    database_flags {
      name  = "night"
      value = "on"
    }
    database_flags {
      name  = "local_infile"
      value = "on"
    }
    availability_type = "ZONAL"
  }
}

# ok: gcp-mysql-local-in-file-off
resource "google_sql_database_instance" "pass" {
  database_version = "MYSQL_8_0"
  name             = "general-mysql81"
  project          = "gcp-bridgecrew-deployment"
  region           = "us-central1"
  settings {
    activation_policy = "ALWAYS"
    availability_type = "ZONAL"
    database_flags {
      name  = "max_allowed_packet"
      value = "536870912"
    }
    database_flags {
      name  = "local_infile"
      value = "off"
    }
    pricing_plan = "PER_USE"
    tier         = "db-n1-standard-1"
  }
}

# ok: gcp-mysql-local-in-file-off
resource "google_sql_database_instance" "pass2" {
  database_version = "MYSQL_5_6"
  name             = "general-mysql81"
  project          = "gcp-bridgecrew-deployment"
  region           = "us-central1"

  settings {
    activation_policy = "ALWAYS"
    availability_type = "ZONAL"

    database_flags {
      name  = "local_infile"
      value = "off"
    }
    pricing_plan = "PER_USE"
    tier         = "db-n1-standard-1"
  }
}

# ok: gcp-mysql-local-in-file-off
resource "google_sql_database_instance" "pass3" {
  database_version = "MYSQL_8_0"
  name             = "general-mysql81"
  project          = "gcp-bridgecrew-deployment"
  region           = "us-central1"

  settings {
    activation_policy = "ALWAYS"
    availability_type = "ZONAL"
    pricing_plan      = "PER_USE"
    tier              = "db-n1-standard-1"
  }
}

# ok: gcp-mysql-local-in-file-off
resource "google_sql_database_instance" "pass4" {
  database_version = "MYSQL_6"
  name             = "general-mysql81"
  project          = "gcp-bridgecrew-deployment"
  region           = "us-central1"

  settings {
    activation_policy = "ALWAYS"
    availability_type = "ZONAL"
    pricing_plan      = "PER_USE"
    tier              = "db-n1-standard-1"
  }
}
