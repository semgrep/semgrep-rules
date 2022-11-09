# fail
# ruleid: azure-appservice-http-logging-enabled
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
# ruleid: azure-appservice-http-logging-enabled
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
        file_system {
        retention_in_days = 4
        retention_in_mb = 10
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
        application_logs {
        azure_blob_storage {
        level = "warning"
        sas_url = "www.example.com"
        retention_in_days = 4
        }
    }

    http_logs {
        file_system {
        retention_in_days = 4
        retention_in_mb = 10
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

# pass
variable "enable_http_logs" {
    type = bool
    default = true
}

variable "enable_http_logs_file_system" {
    type = bool
    default = true
}

variable "http_logs_azure_blob_storage" {
    type = bool
    default = true
}

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

    dynamic "http_logs" {
        for_each = var.enable_http_logs ? [1] : []

        content {
        dynamic "file_system" {
            for_each = var.enable_http_logs_file_system ? [1] : []

            content {
            retention_in_days = 4
            retention_in_mb = 10
            }
        }

        dynamic "azure_blob_storage" {
            for_each = var.http_logs_azure_blob_storage != null ? [1] : []
            content {
            retention_in_days = 10
            sas_url           = "https://something.com"
            }
        }
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