# fail
# ruleid: azure-networkinterface-enable-ip-forwarding
resource "azurerm_network_interface" "example" {
    name                = "example-nic"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name

    ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    }        
    enable_ip_forwarding = true
}

# pass
resource "azurerm_network_interface" "example" {
    name                = "example-nic"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name

    ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    }
    enable_ip_forwarding = false
}

# pass
resource "azurerm_network_interface" "example" {
    name                = "example-nic"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name

    ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    }
}