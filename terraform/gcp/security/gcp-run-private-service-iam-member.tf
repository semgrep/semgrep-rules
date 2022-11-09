# ok: gcp-run-private-service-iam-member
resource "google_cloud_run_service_iam_member" "pass1" {
  location = google_cloud_run_service.default.location
  service = google_cloud_run_service.default.name
  role = "roles/viewer"
  member = "user:jane@example.com"
}

# ok: gcp-run-private-service-iam-member
resource "google_cloud_run_service_iam_member" "pass2" {
  location = google_cloud_run_service.default.location
  service = google_cloud_run_service.default.name
  role = "roles/viewer"
  member = "domain:example.com"
}

# fail
# ruleid: gcp-run-private-service-iam-member
resource "google_cloud_run_service_iam_member" "fail1" {
  location = google_cloud_run_service.default.location
  service = google_cloud_run_service.default.name
  role = "roles/viewer"
  member  = "allAuthenticatedUsers"
}

# fail
# ruleid: gcp-run-private-service-iam-member
resource "google_cloud_run_service_iam_member" "fail2" {
  location = google_cloud_run_service.default.location
  service = google_cloud_run_service.default.name
  role = "roles/viewer"
  member  = "allUsers"
}