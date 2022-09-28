# fail
# ruleid: gcp-gke-master-authz-networks-enabled
resource "google_container_cluster" "fail" {
  name               = "marcellus-wallace"
  location           = "us-central1-a"
  initial_node_count = 3
}

# ok: gcp-gke-master-authz-networks-enabled
resource "google_container_cluster" "success" {
  name               = "marcellus-wallace"
  location           = "us-central1-a"
  initial_node_count = 3
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "73.35.171.194/32"
      display_name = "net1"
    }
  }
}