# fail
# ruleid: azure-securitycenter-standard-pricing
resource "azurerm_security_center_subscription_pricing" "example" {
        tier = "Free"
}

# pass
resource "azurerm_security_center_subscription_pricing" "example" {
        tier = "Standard"
}