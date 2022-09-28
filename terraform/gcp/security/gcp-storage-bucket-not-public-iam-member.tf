# fail
# ruleid: gcp-storage-bucket-not-public-iam-member
resource "google_storage_bucket_iam_member" "fail" {
    bucket = google_storage_bucket.default.name
    role = "roles/storage.admin"
    member = "allUsers"
}

# ok: gcp-storage-bucket-not-public-iam-member
resource "google_storage_bucket_iam_member" "success" {
    bucket = google_storage_bucket.default.name
    role = "roles/storage.admin"
    member = "user:jane@example.com"
}