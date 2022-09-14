# ok: gcp-bigquery-private-table-iam-member
resource "google_bigquery_table_iam_member" "pass1" {
  cluster = "my-private-table-member1"
  role    = "roles/bigquery.connectionUser"
  member  = "group:mygroup@example.com"
}

# ok: gcp-bigquery-private-table-iam-member
resource "google_bigquery_table_iam_member" "pass2" {
  cluster = "my-private-table-member2"
  role    = "roles/bigquery.dataEditor"
  member  = "domain:example.com"
}

# fail
# ruleid: gcp-bigquery-private-table-iam-member
resource "google_bigquery_table_iam_member" "fail1" {
  cluster = "my-public-table-member1"
  role    = "roles/bigquery.metadataViewer"
  member  = "allAuthenticatedUsers"
}

# fail
# ruleid: gcp-bigquery-private-table-iam-member
resource "google_bigquery_table_iam_member" "fail2" {
  cluster = "my-public-table-member2"
  role    = "roles/bigquery.readSessionUser"
  member  = "allUsers"
}