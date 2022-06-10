# fail
# ruleid: azure-appservice-detailed-errormessages-enabled
resource "azurerm_app_service" "example" {
    name                = "example-app-service"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    app_service_plan_id = azurerm_app_service_plan.example.id

    site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
    }

logs {
    application_logs {
        azure_blob_storage {
        level = "warning"
        sas_url = "www.example.com"
        retention_in_days = 4
    }
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

# fail
# ruleid: azure-appservice-detailed-errormessages-enabled
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
    
    logs {
    application_logs {
        azure_blob_storage {
        level = "warning"
        sas_url = "www.example.com"
        retention_in_days = 4
    }
}
detailed_error_messages_enabled = false
} 

    connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
    }
}

# fail
# ruleid: azure-appservice-detailed-errormessages-enabled
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

    logs {
    http_logs {
        retention_in_days = 4
        retention_in_mb = 10
    }
    detailed_error_messages_enabled = true
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

    logs {
    detailed_error_messages_enabled = true
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