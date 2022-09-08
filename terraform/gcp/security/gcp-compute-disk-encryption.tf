# fail
# ruleid: gcp-compute-disk-encryption
resource "google_compute_disk" "fail" {
    name  = "test-disk"
    type  = "pd-ssd"
    zone  = "us-central1-a"
    image = "debian-8-jessie-v20170523"
    physical_block_size_bytes = 4096
}

# ok: gcp-compute-disk-encryption
resource "google_compute_disk" "success" {
    name  = "test-disk"
    type  = "pd-ssd"
    zone  = "us-central1-a"
    image = "debian-8-jessie-v20170523"
    physical_block_size_bytes = 4096
    disk_encryption_key {
        raw_key = "acXTX3rxrKAFTF0tYVLvydU1riRZTvUNC4g5I11NY-c="
    }
}

# ok: gcp-compute-disk-encryption
resource "google_compute_disk" "success" {
    name  = "test-disk"
    type  = "pd-ssd"
    zone  = "us-central1-a"
    image = "debian-8-jessie-v20170523"
    physical_block_size_bytes = 4096
    disk_encryption_key {
        kms_key_self_link = google_kms_crypto_key.example-key.id
    }
}
