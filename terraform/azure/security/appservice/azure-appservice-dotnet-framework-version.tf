# fail
# ruleid: azure-appservice-dotnet-framework-version
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
}

# fail
# ruleid: azure-appservice-dotnet-framework-version
resource "azurerm_app_service" "example" {
    name                = "example-app-service"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    app_service_plan_id = azurerm_app_service_plan.example.id
    https_only          = true
        site_config {
        scm_type        = "someValue"
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
        dotnet_framework_version = "v6.0"
        scm_type                 = "someValue"
    }
}