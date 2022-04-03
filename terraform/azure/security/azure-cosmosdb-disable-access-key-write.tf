# fail
# ruleid: azure-cosmosdb-disable-access-key-write
resource "azurerm_cosmosdb_account" "db" {
    name                = "tfex-cosmos-db-${random_integer.ri.result}"
    location            = azurerm_resource_group.rg.location
}

# pass
resource "azurerm_cosmosdb_account" "db" {
    name                = "tfex-cosmos-db-${random_integer.ri.result}"
    location            = azurerm_resource_group.rg.location
    access_key_metadata_writes_enabled = false
}