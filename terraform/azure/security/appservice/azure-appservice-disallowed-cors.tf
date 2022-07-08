# fail
resource "azurerm_app_service" "example" {
    name                = "example-app-service"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    app_service_plan_id = azurerm_app_service_plan.example.id

    site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
    cors {
        # ruleid: azure-appservice-disallowed-cors
        allowed_origins = ["*"]
    }
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

    site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
    cors {
        allowed_origins = ["192.0.0.1"]
    }
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
