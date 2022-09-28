# fail
# ruleid: gcp-gke-monitoring-enabled
resource "google_container_cluster" "fail" {
    name = "my-gke-cluster"
    location = "us-central1"
    monitoring_service = "none"
  }

# ok: gcp-gke-monitoring-enabled
resource "google_container_cluster" "success" {
  name = "my-gke-cluster"
  location = "us-central1"
  monitoring_service = "monitoring.googleapis.com"
}