# ok: gcp-gke-client-certificate-disabled
resource "google_container_cluster" "fail" {
  name               = "marcellus-wallace"
  location           = "us-central1-a"
  initial_node_count = 3
  master_auth {
    client_certificate_config {
        issue_client_certificate = false
    }
  }
}

# fail
# ruleid: gcp-gke-client-certificate-disabled
resource "google_container_cluster" "success" {
  name               = "marcellus-wallace"
  location           = "us-central1-a"
  initial_node_count = 3
  master_auth {
    client_certificate_config {
        issue_client_certificate = true
    }
  }
}
