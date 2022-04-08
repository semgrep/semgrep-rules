# fail
# ruleid: azure-mysql-geo-backup-enabled
resource "azurerm_mysql_server" "example" {
  name                = var.mysqlserver_name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name

  administrator_login          = var.admin_name
  administrator_login_password = var.password
  sku_name = var.sku_name
  storage_mb = var.storage_mb
  version    = var.server_version

  auto_grow_enabled            = true
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  infrastructure_encryption_enabled = false
    public_network_access_enabled = true
}

# fail
# ruleid: azure-mysql-geo-backup-enabled
resource "azurerm_mysql_server" "example" {
  name                = var.mysqlserver_name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name

  administrator_login          = var.admin_name
  administrator_login_password = var.password
  sku_name = var.sku_name
  storage_mb = var.storage_mb
  version    = var.server_version

  auto_grow_enabled            = true
  backup_retention_days        = 7
  infrastructure_encryption_enabled = false
}

# pass
resource "azurerm_mysql_server" "example" {
  name                = var.mysqlserver_name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name

  administrator_login          = var.admin_name
  administrator_login_password = var.password
  sku_name = var.sku_name
  storage_mb = var.storage_mb
  version    = var.server_version

  auto_grow_enabled            = true
  backup_retention_days        = 7
  geo_redundant_backup_enabled = true
  infrastructure_encryption_enabled = false
  public_network_access_enabled = false
}