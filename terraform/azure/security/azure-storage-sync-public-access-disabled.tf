# fail
# ruleid: azure-storage-sync-public-access-disabled
resource "azurerm_storage_sync" "test" {
    name                = "example-storage-sync"
    resource_group_name = azurerm_resource_group.test.name
    location            = azurerm_resource_group.test.location
    tags = {
    foo = "bar"
    }
}

# fail
# ruleid: azure-storage-sync-public-access-disabled
resource "azurerm_storage_sync" "test" {
    name                = "example-storage-sync"
    resource_group_name = azurerm_resource_group.test.name
    location            = azurerm_resource_group.test.location
    incoming_traffic_policy = "AllowAllTraffic"
    tags = {
    foo = "bar"
    }
}

# pass
resource "azurerm_storage_sync" "test" {
    name                = "example-storage-sync"
    resource_group_name = azurerm_resource_group.test.name
    location            = azurerm_resource_group.test.location
    incoming_traffic_policy = AllowVirtualNetworksOnly
    tags = {
    foo = "bar"
    }
}