# ok: gcp-artifact-registry-private-repo-iam-member
resource "google_artifact_registry_repository_iam_member" "pass1" {
  provider = google-beta
  location = google_artifact_registry_repository.my-repo.location
  repository = google_artifact_registry_repository.my-repo.name
  role = "roles/viewer"
  member = "user:jane@example.com"
}

# ok: gcp-artifact-registry-private-repo-iam-member
resource "google_artifact_registry_repository_iam_member" "pass2" {
  provider = google-beta
  location = google_artifact_registry_repository.my-repo.location
  repository = google_artifact_registry_repository.my-repo.name
  role = "roles/viewer"
  member = "domain:example.com"
}

# fail
# ruleid: gcp-artifact-registry-private-repo-iam-member
resource "google_artifact_registry_repository_iam_member" "fail1" {
  provider = google-beta
  location = google_artifact_registry_repository.my-repo.location
  repository = google_artifact_registry_repository.my-repo.name
  role = "roles/viewer"
  member  = "allAuthenticatedUsers"
}

# fail
# ruleid: gcp-artifact-registry-private-repo-iam-member
resource "google_artifact_registry_repository_iam_member" "fail2" {
  provider = google-beta
  location = google_artifact_registry_repository.my-repo.location
  repository = google_artifact_registry_repository.my-repo.name
  role = "roles/viewer"
  member  = "allUsers"
}