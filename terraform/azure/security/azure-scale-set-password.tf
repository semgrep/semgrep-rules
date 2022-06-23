# fail
# ruleid: azure-scale-set-password
resource "azurerm_linux_virtual_machine_scale_set" "example" {
    name                = var.scaleset_name
    resource_group_name = var.resource_group.name
    location            = var.resource_group.location
    sku                 = var.sku
    instances           = var.instance_count
    admin_username      = var.admin_username
    disable_password_authentication = false
    tags = var.common_tags
}

# pass
resource "azurerm_linux_virtual_machine_scale_set" "example" {
    name                = var.scaleset_name
    resource_group_name = var.resource_group.name
    location            = var.resource_group.location
    sku                 = var.sku
    instances           = var.instance_count
    admin_username      = var.admin_username
    disable_password_authentication = true

    admin_ssh_key {
        username   = var.admin_username
        public_key = tls_private_key.new.public_key_pem
    }
    tags = var.common_tags
}