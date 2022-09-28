# fail
# ruleid: gcp-dataproc-cluster-encrypted-with-cmk
resource "google_dataproc_cluster" "fail" {
  name   = "simplecluster"
  region = "us-central1"
  cluster_config {

  }
}

# ok: gcp-dataproc-cluster-encrypted-with-cmk
resource "google_dataproc_cluster" "pass" {
  name   = "simplecluster"
  region = "us-central1"
  cluster_config {
     encryption_config {
       kms_key_name = "SecretSquirrel"
     }
  }
}