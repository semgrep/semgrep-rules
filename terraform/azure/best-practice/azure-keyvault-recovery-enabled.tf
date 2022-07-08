# fail
# ruleid: azure-keyvault-recovery-enabled
resource "azurerm_key_vault" "example" {
    name                        = "testvault"
    location                    = azurerm_resource_group.example.location
    resource_group_name         = azurerm_resource_group.example.name
    enabled_for_disk_encryption = true
    tenant_id                   = data.azurerm_client_config.current.tenant_id
    sku_name = "standard"
}

# fail
# ruleid: azure-keyvault-recovery-enabled
resource "azurerm_key_vault" "example" {
    name                        = "testvault"
    location                    = azurerm_resource_group.example.location
    resource_group_name         = azurerm_resource_group.example.name
    enabled_for_disk_encryption = true
    tenant_id                   = data.azurerm_client_config.current.tenant_id
    soft_delete_enabled         = false
    sku_name = "standard"
}

# pass
resource "azurerm_key_vault" "example" {
    name                        = "testvault"
    location                    = azurerm_resource_group.example.location
    resource_group_name         = azurerm_resource_group.example.name
    enabled_for_disk_encryption = true
    tenant_id                   = data.azurerm_client_config.current.tenant_id
    soft_delete_enabled         = true
    purge_protection_enabled    = true
    sku_name = "standard"
}

# pass
resource "azurerm_key_vault" "example" {
    name                        = "testvault"
    location                    = azurerm_resource_group.example.location
    resource_group_name         = azurerm_resource_group.example.name
    enabled_for_disk_encryption = true
    tenant_id                   = data.azurerm_client_config.current.tenant_id
    purge_protection_enabled    = true
    sku_name = "standard"
}