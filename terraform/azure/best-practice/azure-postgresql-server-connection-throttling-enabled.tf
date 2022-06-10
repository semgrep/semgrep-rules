# fail
# ruleid: azure-postgresql-server-connection-throttling-enabled
resource "azurerm_postgresql_configuration" "example" {
    name                = "connection_throttling"
    resource_group_name = data.azurerm_resource_group.example.name
    server_name         = azurerm_postgresql_server.example.name
    value               = "off"
}

# pass
resource "azurerm_postgresql_configuration" "example" {
    name                = "connection_throttling"
    resource_group_name = azurerm_resource_group.example.name
    server_name         = azurerm_postgresql_server.example.name
    value               = "on"
}