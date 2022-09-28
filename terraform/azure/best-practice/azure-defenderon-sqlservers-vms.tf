# fail
# ruleid: azure-defenderon-sqlservers-vms
resource "azurerm_security_center_subscription_pricing" "example" {
    tier          = "Free"
    resource_type = "SqlServerVirtualMachines"
}

# pass
resource "azurerm_security_center_subscription_pricing" "example" {
    tier          = "Standard"
    resource_type = "SqlServerVirtualMachines"
}