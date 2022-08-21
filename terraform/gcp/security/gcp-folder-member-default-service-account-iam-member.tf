# fail
# ruleid: gcp-folder-member-default-service-account-iam-member
resource "google_folder_iam_member" "fail1" {
    folder  = "folders/1234567"
    role    = "roles/editor"
    member  = "serviceAccount:test-compute@developer.gserviceaccount.com"
}

# ok:gcp-folder-member-default-service-account-iam-member
resource "google_folder_iam_member" "success1" {
    folder  = "folders/1234567"
    role    = "roles/editor"
    member  = "user:jane@example.com"
}