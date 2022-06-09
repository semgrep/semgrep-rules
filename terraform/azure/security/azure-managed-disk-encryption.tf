# fail
# ruleid: azure-managed-disk-encryption
resource "azurerm_managed_disk" "fail" {
  name                 = var.disk_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.disk_size_gb
  encryption_settings {
    enabled = false
  }
  tags = var.common_tags
}

# pass
resource "azurerm_managed_disk" "pass3" {
  name                 = var.disk_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.disk_size_gb
  tags                 = var.common_tags
}

# pass
resource "azurerm_managed_disk" "pass2" {
  name                 = var.disk_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.disk_size_gb
  encryption_settings {
    enabled = true
  }
  tags = var.common_tags
}

# pass
resource "azurerm_managed_disk" "pass" {
  name                   = "acctestmd1"
  location               = "West US 2"
  resource_group_name    = azurerm_resource_group.example.name
  storage_account_type   = "Standard_LRS"
  create_option          = "Empty"
  disk_size_gb           = "1"
  disk_encryption_set_id = var.encryption_set_id

  tags = {
    environment = "staging"
  }
}


