# fail
# ruleid: gcp-folder-impersonation-roles-iam-member
resource "google_folder_iam_member" "fail1" {
    folder  = "folders/1234567"
    role    = "roles/editor"
    member  = "serviceAccount:test-compute@developer.gserviceaccount.com"
}

# ok: gcp-folder-impersonation-roles-iam-member
resource "google_folder_iam_member" "success1" {
    folder  = "folders/1234567"
    role    = "roles/other"
    member  = "user:jane@example.com"
}