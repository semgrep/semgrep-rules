# fail
# ruleid: gcp-storage-versioning-enabled
resource "google_storage_bucket" "fail1" {
  name     = "foo"
  location = "EU"

  versioning = {
    enabled = false
  }
}

# fail
# ruleid: gcp-storage-versioning-enabled
resource "google_storage_bucket" "fail2" {
  name     = "foo"
  location = "EU"
}

# ok: gcp-storage-versioning-enabled
resource "google_storage_bucket" "pass" {
  name     = "foo"
  location = "EU"

  versioning = {
    enabled = true
  }
}