# fail
# ruleid: gcp-gke-cluster-logging
resource "google_container_cluster" "fail" {
    name = "my-gke-cluster"
    location = "us-central1"
    remove_default_node_pool = true
    initial_node_count = 1
    logging_service = "none"
    master_auth  {
        username = ""
        password= ""
        client_certificate_config {
            issue_client_certificate = false
        }
    }
}

# ok: gcp-gke-cluster-logging
resource "google_container_cluster" "success" {
    name = "my-gke-cluster"
    location = "us-central1"
    remove_default_node_pool = true
    initial_node_count = 1
    master_auth {
        username = ""
        password = ""
        client_certificate_config {
            issue_client_certificate = false
        }
    }
}