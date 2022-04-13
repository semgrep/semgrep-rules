# ruleid: aws-elasticsearch-insecure-tls-version
resource "aws_elasticsearch_domain" "badCode" {
  domain_name = "badCode"
  domain_endpoint_options {
    enforce_https = true
    tls_security_policy = "Policy-Min-TLS-1-0-2019-07"
  }
}

# ok
resource "aws_elasticsearch_domain" "okCode" {
  domain_name = "okCode"
  domain_endpoint_options {
    enforce_https = true
    tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
  }
}
