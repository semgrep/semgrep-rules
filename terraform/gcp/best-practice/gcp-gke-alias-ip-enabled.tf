# fail
# ruleid: gcp-gke-alias-ip-enabled
resource "google_container_cluster" "fail" {
  name                     = "fail-cluster"
}

# ok: gcp-gke-alias-ip-enabled
resource "google_container_cluster" "success" {
  name                     = "success-cluster"
  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "10.32.0.0/14"
    services_ipv4_cidr_block = "10.0.0.0/20"
    use_ip_aliases           = "false"
  }
}