# fail
# ruleid: azure-defenderon-keyvaults
resource "azurerm_security_center_subscription_pricing" "example" {
    tier          = "Free"
    resource_type = "KeyVaults"
}

# pass
resource "azurerm_security_center_subscription_pricing" "example" {
    tier          = "Standard"
    resource_type = "KeyVaults"
}