# fail
# ruleid: gcp-gke-legacy-auth-enabled
resource "google_container_cluster" "fail" {
  name               = "marcellus-wallace"
  location           = "us-central1-a"
  initial_node_count = 3
  enable_legacy_abac = true
}

# ok: gcp-gke-legacy-auth-enabled
resource "google_container_cluster" "success" {
  name               = "marcellus-wallace"
  location           = "us-central1-a"
  initial_node_count = 3
}