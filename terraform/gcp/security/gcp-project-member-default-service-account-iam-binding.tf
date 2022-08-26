# fail
# ruleid: gcp-project-member-default-service-account-iam-binding
resource "google_project_iam_binding" "fail" {
    project = "your-project-id"
    role    = "roles/resourcemanager.organizationAdmin"

    members = [
    "user",
    "serviceAccount:test-compute@developer.gserviceaccount.com",
    ]
}

# ok: gcp-project-member-default-service-account-iam-binding
resource "google_project_iam_binding" "success" {
    project = "your-project-id"
    role    = "roles/other"

    members = [
    "user@mail.com",
    ]
}
