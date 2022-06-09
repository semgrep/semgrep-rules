# fail
# ruleid: azure-storage-account-enables-secure-transfer
resource "azurerm_storage_account" "example" {
    name                     = "storageaccountname"
    resource_group_name      = azurerm_resource_group.example.name
    location                 = azurerm_resource_group.example.location
    account_tier             = "Standard"
    account_replication_type = "GRS"
    enable_https_traffic_only = false

    tags = {
    environment = "staging"
    }
}

# pass
resource "azurerm_storage_account" "example" {
    name                     = "storageaccountname"
    resource_group_name      = azurerm_resource_group.example.name
    location                 = azurerm_resource_group.example.location
    account_tier             = "Standard"
    account_replication_type = "GRS"
    enable_https_traffic_only = true

    tags = {
    environment = "staging"
    }
}

# pass
resource "azurerm_storage_account" "example" {
    name                     = "storageaccountname"
    resource_group_name      = azurerm_resource_group.example.name
    location                 = azurerm_resource_group.example.location
    account_tier             = "Standard"
    account_replication_type = "GRS"
    tags = {
    environment = "staging"
    }
}