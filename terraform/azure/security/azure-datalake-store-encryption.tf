# fail
# ruleid: azure-datalake-store-encryption
resource "azurerm_data_lake_store" "example" {
    name                = "consumptiondatalake"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    
    encryption_state = "Disabled"
}

# ruleid: azure-datalake-store-encryption
resource "azurerm_data_lake_store" "example" {
    name                = "consumptiondatalake"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
}

# pass
resource "azurerm_data_lake_store" "example" {
    name                = "consumptiondatalake"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    
    encryption_state = "Enabled"
}
