# fail
# ruleid: gcp-gke-private-cluster-config
resource "google_container_cluster" "fail" {
  name               = "marcellus-wallace"
  location           = "us-central1-a"
  initial_node_count = 3
}

# ok: gcp-gke-private-cluster-config
resource "google_container_cluster" "success" {
  name               = "marcellus-wallace"
  location           = "us-central1-a"
  initial_node_count = 3
  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes    = false
    master_ipv4_cidr_block  = "10.0.0.0/28"
  }
}