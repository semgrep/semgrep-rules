# fail
# ruleid: gcp-folder-impersonation-roles-iam-binding
resource "google_folder_iam_binding" "fail1" {
    folder  = "folders/1234567"
    role    = "roles/editor"

    members = [
    "user:jane@example.com",
    "serviceAccount:test-compute@appspot.gserviceaccount.com",
    ]
}

# ok: gcp-folder-impersonation-roles-iam-binding
resource "google_folder_iam_binding" "success1" {
    folder  = "folders/1234567"
    role    = "roles/other"

    members = [
    "user:jane@example.com",
    ]
}
