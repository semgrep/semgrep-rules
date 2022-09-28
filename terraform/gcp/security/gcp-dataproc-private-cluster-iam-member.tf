# ok: gcp-dataproc-private-cluster-iam-member
resource "google_dataproc_cluster_iam_member" "pass1" {
  cluster = "my-private-cluster-member1"
  role    = "roles/dataproc.worker"
  member  = "group:mygroup@example.com"
}

# ok: gcp-dataproc-private-cluster-iam-member
resource "google_dataproc_cluster_iam_member" "pass2" {
  cluster = "my-private-cluster-member2"
  role    = "roles/dataproc.editor"
  member  = "domain:example.com"
}

# fail
# ruleid: gcp-dataproc-private-cluster-iam-member
resource "google_dataproc_cluster_iam_member" "fail1" {
  cluster = "my-public-cluster-member1"
  role    = "roles/dataproc.admin"
  member  = "allAuthenticatedUsers"
}

# fail
# ruleid: gcp-dataproc-private-cluster-iam-member
resource "google_dataproc_cluster_iam_member" "fail2" {
  cluster = "my-public-cluster-member2"
  role    = "roles/editor"
  member  = "allUsers"
}
