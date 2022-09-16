# fail
# ruleid: azure-securitycenter-contact-phone
resource "azurerm_security_center_contact" "example" {
    email = "contact@example.com"
}

# pass
resource "azurerm_security_center_contact" "example" {
    email = "contact@example.com"
    phone = "+1-555-555-5555"
}