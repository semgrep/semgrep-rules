# ok: gcp-pubsub-private-topic-iam-member
resource "google_pubsub_topic_iam_member" "pass1" {
  cluster = "my-private-topic-member1"
  role    = "roles/pubsub.publisher"
  member  = "group:mygroup@example.com"
}

# ok: gcp-pubsub-private-topic-iam-member
resource "google_pubsub_topic_iam_member" "pass2" {
  cluster = "my-private-topic-member2"
  role    = "roles/pubsub.subscriber"
  member  = "domain:example.com"
}

# fail
# ruleid: gcp-pubsub-private-topic-iam-member
resource "google_pubsub_topic_iam_member" "fail1" {
  cluster = "my-public-topic-member1"
  role    = "roles/pubsub.subscriber"
  member  = "allAuthenticatedUsers"
}

# fail
# ruleid: gcp-pubsub-private-topic-iam-member
resource "google_pubsub_topic_iam_member" "fail2" {
  cluster = "my-public-topic-member2"
  role    = "roles/pubsub.viewer"
  member  = "allUsers"
}
