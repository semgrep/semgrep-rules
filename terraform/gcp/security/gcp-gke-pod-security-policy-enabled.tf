# fail
# ruleid: gcp-gke-pod-security-policy-enabled
resource "google_container_cluster" "fail" {
  name               = "marcellus-wallace"
  location           = "us-central1-a"
  initial_node_count = 3
}

# ok: gcp-gke-pod-security-policy-enabled
resource "google_container_cluster" "success" {
  name               = "marcellus-wallace"
  location           = "us-central1-a"
  initial_node_count = 3
  pod_security_policy_config {
    enabled = true
  }
}