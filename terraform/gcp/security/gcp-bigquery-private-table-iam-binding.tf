# ok: gcp-bigquery-private-table-iam-binding
resource "google_bigquery_table_iam_binding" "pass1" {
  cluster = "my-private-table-binding1"
  role    = "roles/bigquery.admin"
  members = [
    "user:jane@example.com",
    "group:mygroup@example.com",
  ]
}

# ok: gcp-bigquery-private-table-iam-binding
resource "google_bigquery_table_iam_binding" "pass2" {
  cluster = "my-private-table-binding2"
  role    = "roles/bigquery.connectionAdmin"
  members = [
    "user:jason@example.com",
  ]
}

# fail
# ruleid: gcp-bigquery-private-table-iam-binding
resource "google_bigquery_table_iam_binding" "fail1" {
  cluster = "my-public-table-binding1"
  role    = "roles/bigquery.dataOwner"
  members = [
    "allAuthenticatedUsers",
  ]
}

# fail
# ruleid: gcp-bigquery-private-table-iam-binding
resource "google_bigquery_table_iam_binding" "fail2" {
  cluster = "my-public-table-binding2"
  role    = "roles/bigquery.dataViewer"
  members = [
    "allUsers",
  ]
}

# fail
# ruleid: gcp-bigquery-private-table-iam-binding
resource "google_bigquery_table_iam_binding" "fail3" {
  cluster = "my-public-table-binding3"
  role    = "roles/bigquery.filteredDataViewer"
  members = [
    "allUsers",
    "user:jason@example.com",
  ]
}

# fail
# ruleid: gcp-bigquery-private-table-iam-binding
resource "google_bigquery_table_iam_binding" "fail4" {
  cluster = "my-public-table-binding4"
  role    = "roles/bigquery.jobUser"
  members = [
    "user:jason@example.com",
    "allAuthenticatedUsers",
  ]
}
