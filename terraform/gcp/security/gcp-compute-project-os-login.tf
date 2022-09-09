# fail
# ruleid: gcp-compute-project-os-login
resource "google_compute_project_metadata" "fail" {
  metadata = {
    foo = "bar"
  }
}

# ok: gcp-compute-project-os-login
resource "google_compute_project_metadata" "pass" {
  metadata = {
    foo            = "bar"
    enable-oslogin = "True"
  }
}

# ok: gcp-compute-project-os-login
resource "google_compute_project_metadata" "pass" {
  metadata = {
    foo            = "bar"
    enable-oslogin = True
  }
}
