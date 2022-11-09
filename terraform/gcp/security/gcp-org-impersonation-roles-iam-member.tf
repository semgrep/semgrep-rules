# fail
# ruleid: gcp-org-impersonation-roles-iam-member
resource "google_organization_iam_member" "fail" {
    org_id  = "your-organization-id"
    role    = "roles/editor"
    member  = "serviceAccount:test-compute@developer.gserviceaccount.com"
}

# ok: gcp-org-impersonation-roles-iam-member
resource "google_organization_iam_member" "success" {
    org_id  = "your-organization-id"
    role    = "roles/other"
    member  = "user:jane@example.com"
}