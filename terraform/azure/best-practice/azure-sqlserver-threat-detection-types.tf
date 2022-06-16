# fail
# ruleid: azure-sqlserver-threat-detection-types
resource "azurerm_mssql_server_security_alert_policy" "example" {
    resource_group_name        = azurerm_resource_group.example.name
    server_name                = azurerm_sql_server.example.name
    state                      = "Enabled"
    storage_endpoint           = azurerm_storage_account.example.primary_blob_endpoint
    storage_account_access_key = azurerm_storage_account.example.primary_access_key
    disabled_alerts = [
    "Sql_Injection",
    "Data_Exfiltration"
    ]
    retention_days = 20
}

# pass
resource "azurerm_mssql_server_security_alert_policy" "example" {
    resource_group_name        = azurerm_resource_group.example.name
    server_name                = azurerm_sql_server.example.name
    state                      = "Enabled"
    storage_endpoint           = azurerm_storage_account.example.primary_blob_endpoint
    storage_account_access_key = azurerm_storage_account.example.primary_access_key
    disabled_alerts = []
    retention_days = 20
}