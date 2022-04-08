# fail
# ruleid: azure-aks-uses-azure-policies-addon
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
# ruleid: azure-aks-uses-azure-policies-addon
resource "azurerm_kubernetes_cluster" "example" {
    name                = "example-aks1"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    dns_prefix          = "exampleaks1"

    addon_profile {
    azure_policy {
        enabled = false
    }
    }
    
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
# ruleid: azure-aks-uses-azure-policies-addon
resource "azurerm_kubernetes_cluster" "example" {
    name                = "example-aks1"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    dns_prefix          = "exampleaks1"

    azure_policy {
      enabled = true
    }
    
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
    addon_profile {
      azure_policy {
        enabled = true
      }
    }

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