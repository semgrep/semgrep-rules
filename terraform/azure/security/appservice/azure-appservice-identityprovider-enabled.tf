# fail
# ruleid: azure-appservice-identityprovider-enabled
resource "azurerm_app_service" "example" {
    name                = "example-app-service"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    app_service_plan_id = azurerm_app_service_plan.example.id

    site_config {
        dotnet_framework_version = "v4.0"
        scm_type                 = "LocalGit"
    }

    app_settings = {
        "SOME_KEY" = "some-value"
    }

    connection_string {
        name  = "Database"
        type  = "SQLServer"
        value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
    }
}

# pass
resource "azurerm_app_service" "example" {
    name                = "example-app-service"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    app_service_plan_id = azurerm_app_service_plan.example.id
    https_only          = true
    site_config {
        dotnet_framework_version = "v5.0"
        scm_type                 = "someValue"
    }
    identity {
        type = "SystemAssigned"
    }
}