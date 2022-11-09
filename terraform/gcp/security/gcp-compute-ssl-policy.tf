# fail
# ruleid: gcp-compute-ssl-policy
resource "google_compute_ssl_policy" "fail1" {
    name            = "nonprod-ssl-policy"
    profile         = "MODERN"
}

# fail
# ruleid: gcp-compute-ssl-policy
resource "google_compute_ssl_policy" "fail2" {
    name            = "custom-ssl-policy"
    min_tls_version = "TLS_1_2"
    profile         = "CUSTOM"
    custom_features = ["TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384", "TLS_RSA_WITH_AES_256_GCM_SHA384"]
}

# ok: gcp-compute-ssl-policy
resource "google_compute_ssl_policy" "success1" {
    name            = "nonprod-ssl-policy"
    profile         = "MODERN"
    min_tls_version = "TLS_1_2"
}

# ok: gcp-compute-ssl-policy
resource "google_compute_ssl_policy" "success1" {
    name            = "custom-ssl-policy"
    min_tls_version = "TLS_1_2"
    profile         = "CUSTOM"
    custom_features = ["TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384", "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384"]
}