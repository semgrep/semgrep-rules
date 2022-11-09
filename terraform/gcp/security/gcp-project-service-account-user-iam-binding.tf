# fail
# ruleid: gcp-project-service-account-user-iam-binding
resource "google_project_iam_binding" "fail1" {
    project = "your-project-id"
    role    = "roles/iam.serviceAccountTokenCreator"

    members = [
    "user:jane@example.com",
    ]
}

# fail
# ruleid: gcp-project-service-account-user-iam-binding
resource "google_project_iam_binding" "fail2" {
    project = "your-project-id"
    role    = "roles/iam.serviceAccountUser"

    members = [
    "user:jane@example.com",
    ]
}

# ok: gcp-project-service-account-user-iam-binding
resource "google_project_iam_binding" "success" {
    project = "your-project-id"
    role    = "roles/editor"
    
    members = [
    "user:jane@example.com",
    ]
}