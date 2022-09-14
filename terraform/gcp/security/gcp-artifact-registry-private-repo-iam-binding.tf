# ok: gcp-artifact-registry-private-repo-iam-binding
resource "google_artifact_registry_repository_iam_binding" "pass1" {
  provider = google-beta
  location = google_artifact_registry_repository.my-repo.location
  repository = google_artifact_registry_repository.my-repo.name
  role = "roles/viewer"
  members = [
    "user:jane@example.com",
    "group:mygroup@example.com",
  ]
}

# ok: gcp-artifact-registry-private-repo-iam-binding
resource "google_artifact_registry_repository_iam_binding" "pass2" {
  provider = google-beta
  location = google_artifact_registry_repository.my-repo.location
  repository = google_artifact_registry_repository.my-repo.name
  role = "roles/viewer"
  members = [
    "user:jason@example.com",
  ]
}

# fail
# ruleid: gcp-artifact-registry-private-repo-iam-binding
resource "google_artifact_registry_repository_iam_binding" "fail1" {
  provider = google-beta
  location = google_artifact_registry_repository.my-repo.location
  repository = google_artifact_registry_repository.my-repo.name
  role = "roles/viewer"
  members = [
    "allAuthenticatedUsers",
  ]
}

# fail
# ruleid: gcp-artifact-registry-private-repo-iam-binding
resource "google_artifact_registry_repository_iam_binding" "fail2" {
  provider = google-beta
  location = google_artifact_registry_repository.my-repo.location
  repository = google_artifact_registry_repository.my-repo.name
  role = "roles/viewer"
  members = [
    "allUsers",
  ]
}

# fail
# ruleid: gcp-artifact-registry-private-repo-iam-binding
resource "google_artifact_registry_repository_iam_binding" "fail3" {
  provider = google-beta
  location = google_artifact_registry_repository.my-repo.location
  repository = google_artifact_registry_repository.my-repo.name
  role = "roles/viewer"
  members = [
    "allUsers",
    "user:jason@example.com",
  ]
}

# fail
# ruleid: gcp-artifact-registry-private-repo-iam-binding
resource "google_artifact_registry_repository_iam_binding" "fail4" {
  provider = google-beta
  location = google_artifact_registry_repository.my-repo.location
  repository = google_artifact_registry_repository.my-repo.name
  role = "roles/viewer"
  members = [
    "user:jason@example.com",
    "allAuthenticatedUsers",
  ]
}

# fail
# ruleid: gcp-artifact-registry-private-repo-iam-binding
resource "google_artifact_registry_repository_iam_binding" "fail5" {
  provider = google-beta
  location = google_artifact_registry_repository.my-repo.location
  repository = google_artifact_registry_repository.my-repo.name
  role = "roles/viewer"
  members = [
    "user:jason@example.com",
    "allAuthenticatedUsers",
    "domain:example.com",
  ]
}
