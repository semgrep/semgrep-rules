# fail
# ruleid: azure-cognitiveservices-disables-public-network
resource "azurerm_cognitive_account" "examplea" {
  name                = "example-account"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  kind                = "Face"
  public_network_access_enabled = true
  sku_name = "S0"
}

# fail
# ruleid: azure-cognitiveservices-disables-public-network
resource "azurerm_cognitive_account" "examplea" {
  name                = "example-account"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  kind                = "Face"
  sku_name = "S0"
}

# pass
resource "azurerm_cognitive_account" "examplea" {
  name                = "example-account"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  kind                = "Face"
  public_network_access_enabled = false
  sku_name = "S0"
}