# fail
# ruleid: gcp-org-member-default-service-account-iam-binding
resource "google_organization_iam_binding" "fail" {
    org_id  = "your-organization-id"
    role    = "roles/editor"

    members = [
    "user:jane@example.com",
    "serviceAccount:test-compute@developer.gserviceaccount.com",
    ]
}

# ok: gcp-org-member-default-service-account-iam-binding
resource "google_organization_iam_binding" "success" {
    org_id  = "your-organization-id"
    role    = "roles/other"

    members = [
    "user:jane@example.com",
    ]
}
