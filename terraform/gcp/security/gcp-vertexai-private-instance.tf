# ok: gcp-vertexai-private-instance
resource "google_notebooks_instance" "pass1" {
  name = "pass1-instance"
  location = "us-west1-a"
  machine_type = "e2-medium"
  vm_image {
    project      = "deeplearning-platform-release"
    image_family = "tf-latest-cpu"
  }
  no_public_ip = true
}

# fail
# ruleid: gcp-vertexai-private-instance
resource "google_notebooks_instance" "fail1" {
  name = "fail1-instance"
  location = "us-west1-a"
  machine_type = "e2-medium"
  vm_image {
    project      = "deeplearning-platform-release"
    image_family = "tf-latest-cpu"
  }
  no_public_ip = false
}

# fail
# ruleid: gcp-vertexai-private-instance
resource "google_notebooks_instance" "fail2" {
  name = "fail2-instance"
  location = "us-west1-a"
  machine_type = "e2-medium"
  vm_image {
    project      = "deeplearning-platform-release"
    image_family = "tf-latest-cpu"
  }
}
