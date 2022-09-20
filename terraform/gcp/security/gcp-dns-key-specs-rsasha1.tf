# fail
# ruleid: gcp-dns-key-specs-rsasha1
resource "google_dns_managed_zone" "fail" {
    name        = "example-zone"
    dns_name    = "example-de13he3.com."
    description = "Example DNS zone"
    dnssec_config {
        state = on
        default_key_specs {
            algorithm  = "rsasha1"
            key_length = 1024
            key_type   = "zoneSigning"
        }
        default_key_specs {
            algorithm = "rsasha1"
            key_length = 2048
            key_type = "keySigning"
        }
    }
}

# ok: gcp-dns-key-specs-rsasha1
resource "google_dns_managed_zone" "success" {
    name        = "example-zone"
    dns_name    = "example-de13he3.com."
    description = "Example DNS zone"
    dnssec_config {
        state = on
        default_key_specs {
            algorithm  = "rsasha256"
            key_length = 1024
            key_type   = "zoneSigning"
        }
        default_key_specs {
            algorithm = "rsasha256"
            key_length = 2048
            key_type = "keySigning"
        }
    }
}
