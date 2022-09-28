# fail
# ruleid: gcp-gke-network-policy-enabled
resource "google_container_cluster" "fail" {
  name = "google_cluster"
  network_policy {
    enabled = false
  }
}

# fail
# ruleid: gcp-gke-network-policy-enabled
resource "google_container_cluster" "fail2" {
  name              = "google_cluster"
  datapath_provider = "DATAPATH_PROVIDER_UNSPECIFIED"
  network_policy {
    enabled = false
  }
}

# ok: gcp-gke-network-policy-enabled
resource "google_container_cluster" "pass" {
  name = "google_cluster"
  network_policy {
    enabled = true
  }
}

# ok: gcp-gke-network-policy-enabled
resource "google_container_cluster" "pass2" {
  name              = "google_cluster"
  datapath_provider = "ADVANCED_DATAPATH"
  network_policy {
    enabled = false
  }
}


