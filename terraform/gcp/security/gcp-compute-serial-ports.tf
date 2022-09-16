# fail
# ruleid: gcp-compute-serial-ports
resource "google_compute_instance" "fail" {
    name         = "test"
    machine_type = "n1-standard-1"
    zone         = "us-central1-a"
    boot_disk {}
    metadata = {
        serial-port-enable = true
    }
}

# ok: gcp-compute-serial-ports
resource "google_compute_instance" "success1" {
    name         = "test"
    machine_type = "n1-standard-1"
    zone         = "us-central1-a"
    boot_disk {}
}

# ok: gcp-compute-serial-ports
resource "google_compute_instance" "success2" {
    name         = "test"
    machine_type = "n1-standard-1"
    zone         = "us-central1-a"
    boot_disk {}
    metadata = {
        serial-port-enable = false
    }
}