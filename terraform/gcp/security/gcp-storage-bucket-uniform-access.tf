# ok: gcp-storage-bucket-uniform-access
resource "google_storage_bucket" "enabled" {
  name     = "example"
  location = "EU"
  uniform_bucket_level_access = true
}

# fail
# ruleid: gcp-storage-bucket-uniform-access
resource "google_storage_bucket" "default" {
  name     = "example.com"
  location = "EU"
}

# fail
# ruleid: gcp-storage-bucket-uniform-access
resource "google_storage_bucket" "disabled" {
  name     = "example"
  location = "EU"
  uniform_bucket_level_access = false
}
