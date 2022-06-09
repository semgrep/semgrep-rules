# fail
# ruleid: azure-datafactory-no-public-network-access
resource "azurerm_data_factory" "example" {
    name                = "example"
    location            = "azurerm_resource_group.example.location"
    resource_group_name = "azurerm_resource_group.example.name"
}

# fail
# ruleid: azure-datafactory-no-public-network-access
resource "azurerm_data_factory" "example" {
    name                = "example"
    location            = "azurerm_resource_group.example.location"
    resource_group_name = "azurerm_resource_group.example.name"
    public_network_enabled = true
}

# pass
resource "azurerm_data_factory" "example" {
    name                = "example"
    location            = "azurerm_resource_group.example.location"
    resource_group_name = "azurerm_resource_group.example.name"
    public_network_enabled = false
}