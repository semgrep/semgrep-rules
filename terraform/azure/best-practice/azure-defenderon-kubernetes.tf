# fail
# ruleid: azure-defenderon-kubernetes
resource "azurerm_security_center_subscription_pricing" "example" {
    tier          = "Free"
    resource_type = "KubernetesService"
}

# pass
resource "azurerm_security_center_subscription_pricing" "example" {
    tier          = "Standard"
    resource_type = "KubernetesService"
}