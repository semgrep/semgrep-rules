# fail
# ruleid: azure-defenderon-storage
resource "azurerm_security_center_subscription_pricing" "example" {
    tier          = "Free"
    resource_type = "StorageAccounts"
}

# pass
resource "azurerm_security_center_subscription_pricing" "example" {
    tier          = "Standard"
    resource_type = "StorageAccounts"
}