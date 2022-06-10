# fail
# ruleid: azure-securitycenter-email-alert-admins
resource "azurerm_security_center_contact" "example" {
    email = "contact@example.com"
    alerts_to_admins    = false
}

# pass
resource "azurerm_security_center_contact" "example" {
    email = "contact@example.com"
    phone = "+1-555-555-5555"
    alert_notifications = true
    alerts_to_admins    = true
}