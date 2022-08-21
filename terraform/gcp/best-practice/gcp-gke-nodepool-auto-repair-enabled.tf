# fail
# ruleid: gcp-gke-nodepool-auto-repair-enabled
resource "google_container_node_pool" "fail" {
    name = "my-gke-cluster"
    location = "us-central1"
    cluster = "my-cluster"
    management {
      auto_repair  = false
      auto_upgrade = false
    }
}

# ok: gcp-gke-nodepool-auto-repair-enabled
resource "google_container_node_pool" "success" {
  name = "my-gke-cluster"
  location = "us-central1"
  cluster = "my-cluster"
  management {
    auto_repair  = true
    auto_upgrade = true
  }
}