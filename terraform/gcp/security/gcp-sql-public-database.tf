# fail
# ruleid: gcp-sql-public-database
resource "google_sql_database_instance" "instance1-fail" {
  database_version = "MYSQL_8_0"
  name             = "instance"
  region           = "us-central1"
  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled = true
      authorized_networks {
        name  = "XYZ"
        value = "1.2.3.4"
      }
      authorized_networks {
        name  = "Public"
        value = "0.0.0.0/0"
      }
      authorized_networks {
        name  = "ABC"
        value = "5.5.5.0/24"
      }
    }
  }
}

# fail
# ruleid: gcp-sql-public-database
resource "google_sql_database_instance" "instance4-fail" {
  name             = "instance"
  database_version = "POSTGRES_11"

  settings {
    tier = "db-f1-micro"

    ip_configuration {

      dynamic "authorized_networks" {
        for_each = google_compute_instance.apps
        iterator = apps

        content {
          name  = apps.value.name
          value = apps.value.network_interface.0.access_config.0.nat_ip
        }
      }

      dynamic "authorized_networks" {
        for_each = local.onprem
        iterator = onprem

        content {
          name  = "onprem-${onprem.key}"
          value = "0.0.0.0/0"
        }
      }
    }
  }
}

# ok: gcp-sql-public-database
resource "google_sql_database_instance" "instance2-pass" {
  database_version = "MYSQL_8_0"
  name             = "instance"
  region           = "us-central1"
  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled = true
      authorized_networks {
        name  = "XYZ"
        value = "1.2.3.4"
      }
      authorized_networks {
        name  = "ABC"
        value = "5.5.5.0/24"
      }
    }
  }
}

# ok: gcp-sql-public-database
resource "google_sql_database_instance" "instance5-pass" {
  name             = "instance"
  database_version = "POSTGRES_11"
  settings {
    tier = "db-f1-micro"

    ip_configuration {

      dynamic "authorized_networks" {
        for_each = google_compute_instance.apps
        iterator = apps

        content {
          name  = apps.value.name
          value = apps.value.network_interface.0.access_config.0.nat_ip
        }
      }

      dynamic "authorized_networks" {
        for_each = local.onprem
        iterator = onprem

        content {
          name  = "onprem-${onprem.key}"
          value = onprem.value
        }
      }
    }
  }
}

# ok: gcp-sql-public-database
resource "google_sql_database_instance" "instance6-pass" {
  provider = google-beta

  name   = "private-instance-${random_id.db_name_suffix.hex}"
  region = "us-central1"

  depends_on = [google_service_networking_connection.private_vpc_connection]

  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.private_network.id
    }
  }
}
