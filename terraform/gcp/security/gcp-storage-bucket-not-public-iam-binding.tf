# fail
# ruleid: gcp-storage-bucket-not-public-iam-binding
resource "google_storage_bucket_iam_binding" "fail" {
    bucket = google_storage_bucket.default.name
    role = "roles/storage.admin"
    members = [
    "user:jane@example.com",
    "allAuthenticatedUsers"
    ]
}

# ok: gcp-storage-bucket-not-public-iam-binding
resource "google_storage_bucket_iam_binding" "success" {
    bucket = google_storage_bucket.default.name
    role = "roles/storage.admin"
    members = [
    "user:jane@example.com"
    ]
}