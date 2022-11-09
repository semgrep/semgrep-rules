# fail
# ruleid: gcp-project-member-default-service-account-iam-member
resource "google_project_iam_member" "fail" {
    project = "your-project-id"
    role    = "roles/resourcemanager.organizationAdmin"
    member  = "serviceAccount:test-compute@developer.gserviceaccount.com"
}

# ok: gcp-project-member-default-service-account-iam-member
resource "google_project_iam_member" "success" {
    project = "your-project-id"
    role    = "roles/other"
    member  = "user@mail.com"
}
