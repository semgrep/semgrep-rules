# fail
# ruleid: azure-storage-blob-service-container-private-access
resource "azurerm_storage_container" "example" {
    name                  = "vhds"
    storage_account_name  = azurerm_storage_account.example.name
    container_access_type = "blob"
}

# pass
resource "azurerm_storage_container" "example" {
    name                  = "vhds"
    storage_account_name  = azurerm_storage_account.example.name
    container_access_type = "private"
}