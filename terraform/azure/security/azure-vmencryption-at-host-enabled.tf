# fail
# ruleid: azure-vmencryption-at-host-enabled
resource "azurerm_windows_virtual_machine_scale_set" "example" {
    name                = "example-vmss"
    resource_group_name = azurerm_resource_group.example.name
    location            = azurerm_resource_group.example.location
    sku                 = "Standard_F2"
    instances           = 1
    admin_password      = "P@55w0rd1234!"
    admin_username      = "adminuser"

    source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter-Server-Core"
    version   = "latest"
    }

    os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
    }

    network_interface {
    name    = "example"
    primary = true

    ip_configuration {
        name      = "internal"
        primary   = true
        subnet_id = azurerm_subnet.internal.id
    }
    }
}

# fail
# ruleid: azure-vmencryption-at-host-enabled
resource "azurerm_windows_virtual_machine_scale_set" "example" {
    name                = "example-vmss"
    resource_group_name = azurerm_resource_group.example.name
    location            = azurerm_resource_group.example.location
    sku                 = "Standard_F2"
    instances           = 1
    admin_password      = "P@55w0rd1234!"
    admin_username      = "adminuser"
    encryption_at_host_enabled = false

    source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter-Server-Core"
    version   = "latest"
    }

    os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
    }

    network_interface {
    name    = "example"
    primary = true

    ip_configuration {
        name      = "internal"
        primary   = true
        subnet_id = azurerm_subnet.internal.id
    }
    }
}

# fail
# ruleid: azure-vmencryption-at-host-enabled
resource "azurerm_linux_virtual_machine_scale_set" "example" {
    name                = "example-vmss"
    resource_group_name = azurerm_resource_group.example.name
    location            = azurerm_resource_group.example.location
    sku                 = "Standard_F2"
    instances           = 1
    admin_password      = "P@55w0rd1234!"
    admin_username      = "adminuser"

    source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter-Server-Core"
    version   = "latest"
    }

    os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
    }

    network_interface {
    name    = "example"
    primary = true

    ip_configuration {
        name      = "internal"
        primary   = true
        subnet_id = azurerm_subnet.internal.id
    }
    }
}

# fail
# ruleid: azure-vmencryption-at-host-enabled
resource "azurerm_linux_virtual_machine_scale_set" "example" {
    name                = "example-vmss"
    resource_group_name = azurerm_resource_group.example.name
    location            = azurerm_resource_group.example.location
    sku                 = "Standard_F2"
    instances           = 1
    admin_password      = "P@55w0rd1234!"
    admin_username      = "adminuser"
    encryption_at_host_enabled = false

    source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter-Server-Core"
    version   = "latest"
    }

    os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
    }

    network_interface {
    name    = "example"
    primary = true

    ip_configuration {
        name      = "internal"
        primary   = true
        subnet_id = azurerm_subnet.internal.id
    }
    }
}

# pass
resource "azurerm_windows_virtual_machine_scale_set" "example" {
    name                = "example-vmss"
    resource_group_name = azurerm_resource_group.example.name
    location            = azurerm_resource_group.example.location
    sku                 = "Standard_F2"
    instances           = 1
    admin_password      = "P@55w0rd1234!"
    admin_username      = "adminuser"
    encryption_at_host_enabled = true

    source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter-Server-Core"
    version   = "latest"
    }

    os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
    }

    network_interface {
    name    = "example"
    primary = true

    ip_configuration {
        name      = "internal"
        primary   = true
        subnet_id = azurerm_subnet.internal.id
    }
    }
}

# pass
resource "azurerm_linux_virtual_machine_scale_set" "example" {
    name                = "example-vmss"
    resource_group_name = azurerm_resource_group.example.name
    location            = azurerm_resource_group.example.location
    sku                 = "Standard_F2"
    instances           = 1
    admin_password      = "P@55w0rd1234!"
    admin_username      = "adminuser"
    encryption_at_host_enabled = true

    source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter-Server-Core"
    version   = "latest"
    }

    os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
    }

    network_interface {
    name    = "example"
    primary = true

    ip_configuration {
        name      = "internal"
        primary   = true
        subnet_id = azurerm_subnet.internal.id
    }
    }
}