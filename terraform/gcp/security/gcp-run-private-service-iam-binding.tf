# ok: gcp-run-private-service-iam-binding
resource "google_cloud_run_service_iam_binding" "pass1" {
  location = google_cloud_run_service.default.location
  service = google_cloud_run_service.default.name
  role = "roles/viewer"
  members = [
    "user:jane@example.com",
    "group:mygroup@example.com",
  ]
}

# ok: gcp-run-private-service-iam-binding
resource "google_cloud_run_service_iam_binding" "pass2" {
  location = google_cloud_run_service.default.location
  service = google_cloud_run_service.default.name
  role = "roles/viewer"
  members = [
    "user:jason@example.com",
  ]
}

# fail
# ruleid: gcp-run-private-service-iam-binding
resource "google_cloud_run_service_iam_binding" "fail1" {
  location = google_cloud_run_service.default.location
  service = google_cloud_run_service.default.name
  role = "roles/viewer"
  members = [
    "allAuthenticatedUsers",
  ]
}

# fail
# ruleid: gcp-run-private-service-iam-binding
resource "google_cloud_run_service_iam_binding" "fail2" {
  location = google_cloud_run_service.default.location
  service = google_cloud_run_service.default.name
  role = "roles/viewer"
  members = [
    "allUsers",
  ]
}

# fail
# ruleid: gcp-run-private-service-iam-binding
resource "google_cloud_run_service_iam_binding" "fail3" {
  location = google_cloud_run_service.default.location
  service = google_cloud_run_service.default.name
  role = "roles/viewer"
  members = [
    "allUsers",
    "user:jason@example.com",
  ]
}

# fail
# ruleid: gcp-run-private-service-iam-binding
resource "google_cloud_run_service_iam_binding" "fail4" {
  location = google_cloud_run_service.default.location
  service = google_cloud_run_service.default.name
  role = "roles/viewer"
  members = [
    "user:jason@example.com",
    "allAuthenticatedUsers",
  ]
}

# fail
# ruleid: gcp-run-private-service-iam-binding
resource "google_cloud_run_service_iam_binding" "fail5" {
  location = google_cloud_run_service.default.location
  service = google_cloud_run_service.default.name
  role = "roles/viewer"
  members = [
    "user:jason@example.com",
    "allAuthenticatedUsers",
    "domain:example.com",
  ]
}
