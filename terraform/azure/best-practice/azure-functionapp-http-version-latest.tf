# fail
# ruleid: azure-functionapp-http-version-latest
resource "azurerm_function_app" "example" {
    name                       = "test-azure-functions"
    location                   = azurerm_resource_group.example.location
    resource_group_name        = azurerm_resource_group.example.name
    app_service_plan_id        = azurerm_app_service_plan.example.id
    storage_account_name       = azurerm_storage_account.example.name
    storage_account_access_key = azurerm_storage_account.example.primary_access_key
    os_type                    = "linux"
}

# fail
# ruleid: azure-functionapp-http-version-latest
resource "azurerm_function_app" "example" {
    name                       = "test-azure-functions"
    location                   = azurerm_resource_group.example.location
    resource_group_name        = azurerm_resource_group.example.name
    app_service_plan_id        = azurerm_app_service_plan.example.id
    storage_account_name       = azurerm_storage_account.example.name
    storage_account_access_key = azurerm_storage_account.example.primary_access_key
    os_type                    = "linux"
    site_config {
    http2_enabled = false
    }
}

# pass
resource "azurerm_function_app" "example" {
    name                       = "test-azure-functions"
    location                   = azurerm_resource_group.example.location
    resource_group_name        = azurerm_resource_group.example.name
    app_service_plan_id        = azurerm_app_service_plan.example.id
    storage_account_name       = azurerm_storage_account.example.name
    storage_account_access_key = azurerm_storage_account.example.primary_access_key
    os_type                    = "linux"
    site_config {
    http2_enabled = true
    }
}