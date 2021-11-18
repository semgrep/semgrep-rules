resource "azurerm_app_service" "good_example" {
    name                       = "example-app-service"
    location                   = azurerm_resource_group.example.location
    resource_group_name        = azurerm_resource_group.example.name
    app_service_plan_id        = azurerm_app_service_plan.example.id
    https_only                 = true
}

# ruleid: appservice-enable-https-only
resource "azurerm_app_service" "bad_example" {
  name                = "example-app-service"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id
  https_only          = false
}

# ruleid: appservice-enable-https-only
resource "azurerm_app_service" "bad_example" {
  name                = "example-app-service"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id
}
