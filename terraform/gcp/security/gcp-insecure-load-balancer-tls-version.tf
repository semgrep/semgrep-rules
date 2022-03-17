# ruleid: gcp-insecure-load-balancer-tls-version
resource "google_compute_ssl_policy" "badCode" {
  name = "badCode"
  min_tls_version = "TLS_1_0"
  # ...
}

# ok: gcp-insecure-load-balancer-tls-version
resource "google_compute_ssl_policy" "okCode" {
  name = "okCode"
  min_tls_version = "TLS_1_2"
  # ...
}