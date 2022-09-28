# fail
# ruleid: gcp-project-default-network
resource "google_project" "fail" {
    name       = "My Project"
    project_id = "your-project-id"
    org_id     = "1234567"
}

# ok: gcp-project-default-network
resource "google_project" "pass" {
    name       = "My Project"
    project_id = "your-project-id"
    org_id     = "1234567"
    auto_create_network   = false
}