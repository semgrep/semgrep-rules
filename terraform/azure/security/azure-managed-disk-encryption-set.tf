# fail
# ruleid: azure-managed-disk-encryption-set
resource "azurerm_managed_disk" "source" {
    name                 = "acctestmd1"
    location             = "West US 2"
    resource_group_name  = azurerm_resource_group.example.name
    storage_account_type = "Standard_LRS"
    create_option        = "Empty"
    disk_size_gb         = "1"
    tags = {
    environment = "staging"
    }
}

# pass
resource "azurerm_managed_disk" "source" {
    name                 = "acctestmd1"
    location             = "West US 2"
    resource_group_name  = azurerm_resource_group.example.name
    storage_account_type = "Standard_LRS"
    create_option        = "Empty"
    disk_size_gb         = "1"
    disk_encryption_set_id = "koko"
    tags = {
    environment = "staging"
    }
}