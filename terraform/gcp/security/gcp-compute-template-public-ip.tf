# fail
# ruleid: gcp-compute-template-public-ip
resource "google_compute_instance_template" "fail" {
  name         = "test"
  machine_type = "n1-standard-1"

  disk {}
  network_interface {
    network = "default"
    access_config {

    }
  }
}

# ok: gcp-compute-template-public-ip
resource "google_compute_instance_template" "pass" {
  name         = "test"
  machine_type = "n1-standard-1"
  disk {}
}