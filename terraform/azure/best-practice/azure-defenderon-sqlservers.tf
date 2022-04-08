# fail
# ruleid: azure-defenderon-sqlservers
resource "azurerm_security_center_subscription_pricing" "example" {
    tier          = "Free"
    resource_type = "SqlServers"
}

# pass
resource "azurerm_security_center_subscription_pricing" "example" {
    tier          = "Standard"
    resource_type = "SqlServers"
}