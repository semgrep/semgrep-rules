# ruleid: elastic-search-encryption-at-rest
resource "aws_elasticsearch_domain" "monitoring-framework" {
  domain_name           = "tg-test-es"
  elasticsearch_version = "2.3"
  cluster_config {
    instance_type            = "t2.small.elasticsearch"
    instance_count           = 1
    dedicated_master_enabled = false
    dedicated_master_type    = "m4.large.elasticsearch"
    dedicated_master_count   = 1
  }
  ebs_options {
    ebs_enabled = true
    volume_size = 30
  }
}

# ruleid: elastic-search-encryption-at-rest
resource "aws_elasticsearch_domain" "monitoring-framework" {
  domain_name           = "tg-test-es"
  elasticsearch_version = "2.3"
  encrypt_at_rest {
    enabled = false
  }
  cluster_config {
    instance_type            = "t2.small.elasticsearch"
    instance_count           = 1
    dedicated_master_enabled = false
    dedicated_master_type    = "m4.large.elasticsearch"
    dedicated_master_count   = 1
  }
  ebs_options {
    ebs_enabled = true
    volume_size = 30
  }
}

resource "aws_elasticsearch_domain" "monitoring-framework" {
  domain_name           = "tg-test-es"
  elasticsearch_version = "2.3"
  encrypt_at_rest {
    enabled = true
  }
  cluster_config {
    instance_type            = "t2.small.elasticsearch"
    instance_count           = 1
    dedicated_master_enabled = false
    dedicated_master_type    = "m4.large.elasticsearch"
    dedicated_master_count   = 1
  }
  ebs_options {
    ebs_enabled = true
    volume_size = 30
  }
}
