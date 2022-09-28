# fail
# ruleid: gcp-project-service-account-user-iam-member
resource "google_project_iam_member" "fail1" {
    project = "your-project-id"
    role    = "roles/iam.serviceAccountTokenCreator"
    member  = "user:jane@example.com"
}

# fail
# ruleid: gcp-project-service-account-user-iam-member
resource "google_project_iam_member" "fail2" {
    project = "your-project-id"
    role    = "roles/iam.serviceAccountUser"
    member  = "user:jane@example.com"
}

# ok: gcp-project-service-account-user-iam-member
resource "google_project_iam_member" "success" {
    project = "your-project-id"
    role    = "roles/editor"
    member  = "user:jane@example.com"
}
