# ok: gcp-dataproc-private-cluster-iam-binding
resource "google_dataproc_cluster_iam_binding" "pass1" {
  cluster = "my-private-cluster-binding1"
  role    = "roles/dataproc.serviceAgent"
  members = [
    "user:jane@example.com",
    "group:mygroup@example.com",
  ]
}

# ok: gcp-dataproc-private-cluster-iam-binding
resource "google_dataproc_cluster_iam_binding" "pass2" {
  cluster = "my-private-cluster-binding2"
  role    = "roles/dataproc.viewer"
  members = [
    "user:jason@example.com",
  ]
}

# fail
# ruleid: gcp-dataproc-private-cluster-iam-binding
resource "google_dataproc_cluster_iam_binding" "fail1" {
  cluster = "my-public-cluster-binding1"
  role    = "roles/dataproc.hubAgent"
  members = [
    "allAuthenticatedUsers",
  ]
}

# fail
# ruleid: gcp-dataproc-private-cluster-iam-binding
resource "google_dataproc_cluster_iam_binding" "fail2" {
  cluster = "my-public-cluster-binding2"
  role    = "roles/dataproc.editor"
  members = [
    "allUsers",
  ]
}

# fail
# ruleid: gcp-dataproc-private-cluster-iam-binding
resource "google_dataproc_cluster_iam_binding" "fail3" {
  cluster = "my-public-cluster-binding3"
  role    = "roles/dataproc.editor"
  members = [
    "allUsers",
    "user:jason@example.com",
  ]
}

# fail
# ruleid: gcp-dataproc-private-cluster-iam-binding
resource "google_dataproc_cluster_iam_binding" "fail4" {
  cluster = "my-public-cluster-binding4"
  role    = "roles/dataproc.editor"
  members = [
    "user:jason@example.com",
    "allUsers",
  ]
}