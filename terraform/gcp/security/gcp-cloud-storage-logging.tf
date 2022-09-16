# fail
# ruleid: gcp-cloud-storage-logging
resource "google_storage_bucket" "fail" {
    name     = "jgwloggingbucket"
    location = var.location
    uniform_bucket_level_access = true
}

# ok: gcp-cloud-storage-logging
resource "google_storage_bucket" "success" {
    name     = "jgwloggingbucket"
    location = var.location
    uniform_bucket_level_access = true
    logging {
        log_bucket = "mylovelybucket"
    }
}