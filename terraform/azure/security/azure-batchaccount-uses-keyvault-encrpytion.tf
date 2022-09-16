# fail
# ruleid: azure-batchaccount-uses-keyvault-encrpytion
resource "azurerm_batch_account" "example" {
    name                 = "testbatchaccount"
    resource_group_name  = azurerm_resource_group.example.name
    location             = azurerm_resource_group.example.location
    pool_allocation_mode = "BatchService"
    storage_account_id   = azurerm_storage_account.example.id

    tags = {
    env = "test"
    }
}

# pass
resource "azurerm_batch_account" "example" {
    name                 = "testbatchaccount"
    resource_group_name  = azurerm_resource_group.example.name
    location             = azurerm_resource_group.example.location
    pool_allocation_mode = "BatchService"
    storage_account_id   = azurerm_storage_account.example.id
    key_vault_reference {
    id = "test"
    url = "https://test.com"
    }

    tags = {
    env = "test"
    }
}