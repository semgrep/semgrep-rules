# fail
# ruleid: azure-postgresql-encryption-enabled
resource "azurerm_postgresql_server" "example" {
    name                = "example-psqlserver"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name

    administrator_login          = "psqladminun"
    administrator_login_password = "H@Sh1CoR3!"

    sku_name   = "GP_Gen5_4"
    version    = "9.6"
    storage_mb = 640000

    backup_retention_days        = 7
    infrastructure_encryption_enabled = false
    auto_grow_enabled            = true
    public_network_access_enabled    = true
    ssl_enforcement_enabled          = true
    ssl_minimal_tls_version_enforced = "TLS1_2"
}

# fail
# ruleid: azure-postgresql-encryption-enabled
resource "azurerm_postgresql_server" "example" {
    name                = "example-psqlserver"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    administrator_login          = "psqladminun"
    administrator_login_password = "H@Sh1CoR3!"
    sku_name   = "GP_Gen5_4"
    version    = "9.6"
    storage_mb = 640000
    backup_retention_days        = 7
    auto_grow_enabled            = true
    ssl_enforcement_enabled          = true
    ssl_minimal_tls_version_enforced = "TLS1_2"
}

# pass
resource "azurerm_postgresql_server" "example" {
    name                = "example-psqlserver"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    administrator_login          = "psqladminun"
    administrator_login_password = "H@Sh1CoR3!"
    sku_name   = "GP_Gen5_4"
    version    = "9.6"
    storage_mb = 640000
    backup_retention_days        = 7
    infrastructure_encryption_enabled = true
    auto_grow_enabled            = true
    public_network_access_enabled    = false
    ssl_enforcement_enabled          = true
    ssl_minimal_tls_version_enforced = "TLS1_2"
}