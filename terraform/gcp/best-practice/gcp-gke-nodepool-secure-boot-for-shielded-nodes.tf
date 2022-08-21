# fail
# ruleid: gcp-gke-nodepool-secure-boot-for-shielded-nodes
resource "google_container_node_pool" "fail1" {
  project  = data.google_project.project.name
  name     = var.node_pool["name"]
  location = var.location
  cluster  = google_container_cluster.cluster.name

  node_count        = var.node_pool["node_count"]
  max_pods_per_node = var.node_pool["max_pods_per_node"]

  node_config {
    machine_type = var.node_pool["machine_type"]
    disk_size_gb = var.node_pool["disk_size_gb"]
    disk_type    = var.node_pool["disk_type"]

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}

# fail
# ruleid: gcp-gke-nodepool-secure-boot-for-shielded-nodes
resource "google_container_node_pool" "fail2" {
  project  = data.google_project.project.name
  name     = var.node_pool["name"]
  location = var.location
  cluster  = google_container_cluster.cluster.name

  node_count        = var.node_pool["node_count"]
  max_pods_per_node = var.node_pool["max_pods_per_node"]

  node_config {
    machine_type = var.node_pool["machine_type"]
    disk_size_gb = var.node_pool["disk_size_gb"]
    disk_type    = var.node_pool["disk_type"]

    workload_metadata_config {
      node_metadata = "GKE_METADATA_SERVER"
    }
    shielded_instance_config {
      enable_secure_boot = false
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}

# ok: gcp-gke-nodepool-secure-boot-for-shielded-nodes
resource "google_container_node_pool" "success" {
  project  = data.google_project.project.name
  name     = var.node_pool["name"]
  location = var.location
  cluster  = google_container_cluster.cluster.name

  node_count        = var.node_pool["node_count"]
  max_pods_per_node = var.node_pool["max_pods_per_node"]

  node_config {
    machine_type = var.node_pool["machine_type"]
    disk_size_gb = var.node_pool["disk_size_gb"]
    disk_type    = var.node_pool["disk_type"]

    workload_metadata_config {
      node_metadata = "GKE_METADATA_SERVER"
    }

    shielded_instance_config {
      enable_secure_boot = true
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
