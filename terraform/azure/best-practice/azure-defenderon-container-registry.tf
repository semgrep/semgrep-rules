# fail
# ruleid: azure-defenderon-container-registry
resource "azurerm_security_center_subscription_pricing" "example" {
    tier          = "Free"
    resource_type = "ContainerRegistry"
}

# pass
resource "azurerm_security_center_subscription_pricing" "example" {
    tier          = "Standard"
    resource_type = "ContainerRegistry"
}