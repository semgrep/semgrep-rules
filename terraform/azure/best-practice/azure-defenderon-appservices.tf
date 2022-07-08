# fail
# ruleid: azure-defenderon-appservices
resource "azurerm_security_center_subscription_pricing" "example" {
    tier          = "Free"
    resource_type = "AppServices"
}

# pass
resource "azurerm_security_center_subscription_pricing" "example" {
    tier          = "Standard"
    resource_type = "AppServices"
}