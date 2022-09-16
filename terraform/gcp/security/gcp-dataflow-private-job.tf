# ok: gcp-dataflow-private-job
resource "google_dataflow_job" "pass" {
  name              = "my-pass-job"
  template_gcs_path = "gs://my-bucket/templates/template_file"
  temp_gcs_location = "gs://my-bucket/tmp_dir"
  parameters = {
    foo = "bar"
    baz = "qux"
  }
  ip_configuration = "WORKER_IP_PRIVATE"
}


# fail
# ruleid: gcp-dataflow-private-job
resource "google_dataflow_job" "fail1" {
  name              = "my-fail-job1"
  template_gcs_path = "gs://my-bucket/templates/template_file"
  temp_gcs_location = "gs://my-bucket/tmp_dir"
  parameters = {
    foo = "bar"
    baz = "qux"
  }

}

# fail
# ruleid: gcp-dataflow-private-job
resource "google_dataflow_job" "fail2" {
  name              = "my-fail-job2"
  template_gcs_path = "gs://my-bucket/templates/template_file"
  temp_gcs_location = "gs://my-bucket/tmp_dir"
  parameters = {
    foo = "bar"
    baz = "qux"
  }
  ip_configuration = "WORKER_IP_PUBLIC"
}
