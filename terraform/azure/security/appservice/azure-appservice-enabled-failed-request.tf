# fail
# ruleid: azure-appservice-enabled-failed-request
resource "azurerm_app_service" "example" {
    name                = "example-app-service"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    app_service_plan_id = azurerm_app_service_plan.example.id
    https_only          = true
    logs {
        failed_request_tracing_enabled = false
    }
}

# fail
# missing logs attribute
# ruleid: azure-appservice-enabled-failed-request
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

# fail
# missing tracing enabled attribute
# ruleid: azure-appservice-enabled-failed-request
resource "azurerm_app_service" "example" {
    name                = "example-app-service"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    app_service_plan_id = azurerm_app_service_plan.example.id
    https_only          = true
    site_config {
        scm_type        = "someValue"
    }
    logs {
        application_logs = "test"
    }
}

# pass
resource "azurerm_app_service" "example" {
    name                = "example-app-service"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    app_service_plan_id = azurerm_app_service_plan.example.id
    https_only          = true
    logs {
        failed_request_tracing_enabled = true
    }
    storage_account {
        name = "test_name"
        type = "AzureFiles"
        account_name ="test_account_name"
        share_name = "test_share_name"
        access_key = "test_access_key"
    }
}