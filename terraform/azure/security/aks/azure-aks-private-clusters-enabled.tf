# fail
# ruleid: azure-aks-private-clusters-enabled
resource "azurerm_kubernetes_cluster" "example" {
name                = "example-aks1"
location            = azurerm_resource_group.example.location
resource_group_name = azurerm_resource_group.example.name
dns_prefix          = "exampleaks1"

    default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
    }              
    identity {
    type = "SystemAssigned"
    }                
    tags = {
    Environment = "Production"
    }
}

# fail
# ruleid: azure-aks-private-clusters-enabled
resource "azurerm_kubernetes_cluster" "example" {
    name                = "example-aks1"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    dns_prefix          = "exampleaks1"
    private_cluster_enabled = false
    
    default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
    }

    identity {
    type = "SystemAssigned"
    }

    tags = {
    Environment = "Production"
    }
}

# pass
resource "azurerm_kubernetes_cluster" "example" {
name                = "example-aks1"
location            = azurerm_resource_group.example.location
resource_group_name = azurerm_resource_group.example.name
dns_prefix          = "exampleaks1"
private_cluster_enabled = true

default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
}

identity {
    type = "SystemAssigned"
}

tags = {
    Environment = "Production"
}
}