# pass

resource "azurerm_app_service" "good_example" {
  name                = "example-app-service"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id
}

resource "azurerm_app_service" "good_example" {
  name                = "example-app-service"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
      min_tls_version = "1.2"
  }
}

resource "google_compute_ssl_policy" "good_example" {
  # ok: appservice-use-secure-tls-policy
  min_tls_version = "TLS_1_2"
  name            = "modern-ssl-policy"
  profile         = "MODERN"
}

# fail

resource "azurerm_app_service" "bad_example" {
  name                = "example-app-service"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  # ruleid: appservice-use-secure-tls-policy
  site_config {
      min_tls_version = "1.0"
  }
}

resource "azurerm_app_service" "bad_example" {
  name                = "example-app-service"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  # ruleid: appservice-use-secure-tls-policy
  site_config {
      min_tls_version = "1.1"
  }
}
