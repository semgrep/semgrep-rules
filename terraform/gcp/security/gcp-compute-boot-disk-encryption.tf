# fail
# ruleid: gcp-compute-boot-disk-encryption
resource "google_compute_instance" "fail" {
    name         = "test"
    machine_type = "n1-standard-1"
    zone         = "us-central1-a"
    boot_disk {}
}

# ok: gcp-compute-boot-disk-encryption
resource "google_compute_instance" "success" {
    name         = "test"
    machine_type = "n1-standard-1"
    zone         = "us-central1-a"
    boot_disk {
        disk_encryption_key_raw = "acXTX3rxrKAFTF0tYVLvydU1riRZTvUNC4g5I11NY-c="
    }
}

# ok: gcp-compute-boot-disk-encryption
resource "google_compute_instance" "success" {
    name         = "test"
    machine_type = "n1-standard-1"
    zone         = "us-central1-a"
    boot_disk {
        kms_key_self_link = google_kms_crypto_key.example-key.id
    }
}
