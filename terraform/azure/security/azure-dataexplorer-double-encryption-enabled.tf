# fail
# ruleid: azure-dataexplorer-double-encryption-enabled
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
# ruleid: azure-dataexplorer-double-encryption-enabled
resource "azurerm_kusto_cluster" "example" {
    name                = "kustocluster"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    double_encryption_enabled = false

    sku {
    name     = "Standard_D13_v2"
    capacity = 2
    }

    tags = {
    Environment = "Production"
    }
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
    
    double_encryption_enabled = true

    tags = {
    Environment = "Production"
    }
}