# fail
# ruleid: gcp-compute-template-shielded-vm
resource "google_compute_instance_template" "fail" {
    name         = "test"
    machine_type = "n1-standard-1"
    zone         = "us-central1-a"
    boot_disk {}
    shielded_instance_config {
        enable_integrity_monitoring = false
    }
}

# ok: gcp-compute-template-shielded-vm
resource "google_compute_instance_template" "success1" {
    name         = "test"
    machine_type = "n1-standard-1"
    zone         = "us-central1-a"
    boot_disk {}
    shielded_instance_config {}
}

# ok: gcp-compute-template-shielded-vm
resource "google_compute_instance_from_template" "success2" {
    name         = "test"
    source_instance_template = google_compute_instance_template.default.id
    shielded_instance_config {
        enable_vtpm = true
    }
}