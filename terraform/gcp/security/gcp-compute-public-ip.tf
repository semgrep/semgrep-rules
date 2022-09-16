# fail
# ruleid: gcp-compute-public-ip
resource "google_compute_instance" "fail" {
  name         = "test"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"
  boot_disk {
    auto_delete = true
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}

# ok: gcp-compute-public-ip
resource "google_compute_instance" "pass" {
  name         = "test"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"
  boot_disk {
    auto_delete = true
  }
  network_interface {

  }
}