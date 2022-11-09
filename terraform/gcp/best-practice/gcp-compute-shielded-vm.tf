# fail
# ruleid: gcp-compute-shielded-vm
resource "google_compute_instance" "fail1" {
    name         = "test"
    machine_type = "n1-standard-1"
    zone         = "us-central1-a"
    boot_disk {}
}

# fail
# ruleid: gcp-compute-shielded-vm
resource "google_compute_instance" "fail2" {
    name         = "test"
    machine_type = "n1-standard-1"
    zone         = "us-central1-a"
    boot_disk {}
    shielded_instance_config {
        enable_integrity_monitoring = false
    }
}

# ok: gcp-compute-shielded-vm
resource "google_compute_instance" "success" {
    name         = "test"
    machine_type = "n1-standard-1"
    zone         = "us-central1-a"
    boot_disk {}
    shielded_instance_config {
        enable_vtpm = true
        enable_integrity_monitoring = true
    }
}
