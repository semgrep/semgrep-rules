# fail
# ruleid: azure-dataexplorer-uses-disk-encryption
resource "azurerm_kusto_cluster" "example" {
    name                = "kustocluster"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    sku {
    name     = "Standard_D13_v2"
    capacity = 2
    }

    tags = {
    Environment = "Production"
    }
}

# fail
# ruleid: azure-dataexplorer-uses-disk-encryption
resource "azurerm_kusto_cluster" "example" {
    name                = "kustocluster"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    sku {
    name     = "Standard_D13_v2"
    capacity = 2
    }

    tags = {
    Environment = "Production"
    }
    enable_disk_encryption = false
}

# pass
resource "azurerm_kusto_cluster" "example" {
    name                = "kustocluster"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    sku {
    name     = "Standard_D13_v2"
    capacity = 2
    }
    tags = {
    Environment = "Production"
    }
    enable_disk_encryption = true
}