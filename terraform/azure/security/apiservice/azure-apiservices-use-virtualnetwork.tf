# fail
# ruleid: azure-apiservices-use-virtualnetwork
resource "azurerm_api_management" "example" {
    name                = "example-apim"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    publisher_name      = "My Company"
    publisher_email     = "company@terraform.io"

    sku_name = "Developer_1"

    policy {
    xml_content = <<XML
    <policies>
        <inbound />
        <backend />
        <outbound />
        <on-error />
    </policies>
XML

    }
}

# pass
resource "azurerm_api_management" "example" {
    name                = "example-apim"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    publisher_name      = "My Company"
    publisher_email     = "company@terraform.io"

    sku_name = "Developer_1"
    virtual_network_configuration {
    subnet_id = azure_subnet.subnet_not_public_ip.id
    }
    policy {
    xml_content = <<XML
    <policies>
        <inbound />
        <backend />
        <outbound />
        <on-error />
    </policies>
XML

    }
}