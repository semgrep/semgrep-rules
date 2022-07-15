# fail
# ruleid: azure-defenderon-servers
resource "azurerm_security_center_subscription_pricing" "example" {
    tier          = "Free"
    resource_type = "VirtualMachines"
}

# pass
resource "azurerm_security_center_subscription_pricing" "example" {
    tier          = "Standard"
    resource_type = "VirtualMachines"
}