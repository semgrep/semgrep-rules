# fail
# ruleid: azure-appservice-java-version
resource "azurerm_app_service" "example" {
  name                = "example-app-service"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id
  https_only          = true
  site_config {
    java_version = "1.7.0_80"
    scm_type                 = "someValue"
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
    java_version = "11"
    scm_type                 = "someValue"
  }
}