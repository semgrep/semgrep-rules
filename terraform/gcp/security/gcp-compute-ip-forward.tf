# fail
# ruleid: gcp-compute-ip-forward
resource "google_compute_instance" "fail" {
    name         = "test"
    machine_type = "n1-standard-1"
    zone         = "us-central1-a"
    can_ip_forward = true
}

# ok: gcp-compute-ip-forward
resource "google_compute_instance" "success" {
    name         = "test"
    machine_type = "n1-standard-1"
    zone         = "us-central1-a"
}

# ok: gcp-compute-ip-forward
resource "google_compute_instance" "success2" {
    name         = "gke-test"
    machine_type = "n1-standard-1"
    zone         = "us-central1-a"
    can_ip_forward = false
}