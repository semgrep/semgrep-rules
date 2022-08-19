# fail
# ruleid: gcp-compute-template-ip-forward
resource "google_compute_instance_template" "fail" {
    name         = "test"
    source_instance_template = google_compute_instance_template.default.id
    can_ip_forward = true
}

# ok: gcp-compute-template-ip-forward
resource "google_compute_instance_template" "success" {
    name         = "test"
    source_instance_template = google_compute_instance_template.default.id
}

# ok: gcp-compute-template-ip-forward
resource "google_compute_instance_template" "success2" {
    name         = "gke-test"
    source_instance_template = google_compute_instance_template.default.id
    can_ip_forward = false
}