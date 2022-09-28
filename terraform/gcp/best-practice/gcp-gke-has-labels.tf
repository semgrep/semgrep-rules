# fail
# ruleid: gcp-gke-has-labels
resource "google_container_cluster" "fail1" {
    name = "my-gke-cluster"
    location = "us-central1"
    remove_default_node_pool = True
    initial_node_count = 1
    logging_service = "none"
}

# fail
# ruleid: gcp-gke-has-labels
resource "google_container_cluster" "fail2" {
    name = "my-gke-cluster"
    location = "us-central1"
    remove_default_node_pool = True
    initial_node_count = 1
    logging_service = "none"
    resource_labels = {}
}

# ok: gcp-gke-has-labels
resource "google_container_cluster" "success" {
    name = "my-gke-cluster"
    location = "us-central1"
    remove_default_node_pool = True
    initial_node_count = 1
    logging_service = "none"
    resource_labels = {
        "Owner" = "value"
    }
}