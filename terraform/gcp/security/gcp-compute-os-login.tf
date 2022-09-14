# fail
# ruleid: gcp-compute-os-login
resource "google_compute_instance" "fail" {
    name         = "test"
    machine_type = "n1-standard-1"
    zone         = "us-central1-a"
    boot_disk {}
    metadata = {
        enable-oslogin = false
    }
}

# ok: gcp-compute-os-login
resource "google_compute_instance" "success1" {
    name         = "test"
    machine_type = "n1-standard-1"
    zone         = "us-central1-a"
    boot_disk {}
    metadata = {
        foo = "bar"
    }
}

# ok: gcp-compute-os-login
resource "google_compute_instance" "success2" {
    name         = "test"
    machine_type = "n1-standard-1"
    zone         = "us-central1-a"
    boot_disk {}
    metadata = {
        enable-oslogin = true
    }
}