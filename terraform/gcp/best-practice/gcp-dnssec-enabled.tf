# fail
# ruleid: gcp-dnssec-enabled
resource "google_dns_managed_zone" "fail1" {
    name        = "example-zone"
    dns_name    = "example-de13he3.com."
    description = "Example DNS zone"
    dnssec_config {
        state = off
    }
}

# fail
# ruleid: gcp-dnssec-enabled
resource "google_dns_managed_zone" "fail2" {
    name        = "example-zone"
    dns_name    = "example-de13he3.com."
    description = "Example DNS zone"
}

# ok: gcp-dnssec-enabled
resource "google_dns_managed_zone" "success" {
    name        = "example-zone"
    dns_name    = "example-de13he3.com."
    description = "Example DNS zone"
    dnssec_config {
        state = on
    }
}
