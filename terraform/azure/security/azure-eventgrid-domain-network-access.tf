# fail
# ruleid: azure-eventgrid-domain-network-access
resource "azurerm_eventgrid_domain" "example" {
    name                = "example-app-service"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
}

# fail
# ruleid: azure-eventgrid-domain-network-access
resource "azurerm_eventgrid_domain" "example" {
    name                = "example-app-service"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    
    public_network_access_enabled = true
}

# pass
resource "azurerm_eventgrid_domain" "example" {
    name                = "example-app-service"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    
    public_network_access_enabled = false
}