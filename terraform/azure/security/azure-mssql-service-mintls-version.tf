# fail
resource "azurerm_mssql_server" "examplea" {
    name                          = var.server_name
    resource_group_name           = var.resource_group.name
    location                      = var.resource_group.location
    version                       = var.sql["version"]
    administrator_login           = var.sql["administrator_login"]
    administrator_login_password  = local.administrator_login_password
    # ruleid: azure-mssql-service-mintls-version
    minimum_tls_version           = "1.0"
    public_network_access_enabled = var.sql["public_network_access_enabled"]
    identity {
    type = "SystemAssigned"
    }
    tags = var.common_tags
}

# pass
resource "azurerm_mssql_server" "examplea" {
    name                          = var.server_name
    resource_group_name           = var.resource_group.name
    location                      = var.resource_group.location
    version                       = var.sql["version"]
    administrator_login           = var.sql["administrator_login"]
    administrator_login_password  = local.administrator_login_password
    minimum_tls_version           = "1.2"
    public_network_access_enabled = var.sql["public_network_access_enabled"]
    identity {
    type = "SystemAssigned"
    }
    tags = var.common_tags
}