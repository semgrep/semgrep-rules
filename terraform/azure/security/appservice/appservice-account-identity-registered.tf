# Pass
# ok: appservice-account-identity-registered
resource "azurerm_app_service" "good_example" {
  name                = "example-app-service"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  identity {
    type = "UserAssigned"
    identity_ids = "webapp"
  }
}

# ok: appservice-account-identity-registered
resource "azurerm_app_service" "civiform_app" {
  name                = "${var.application_name}-${random_pet.server.id}"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.plan.id

  app_settings = local.app_settings

  identity {
    type = "SystemAssigned"
  }

  logs {
    http_logs {
      file_system {
        retention_in_days = 1
        retention_in_mb   = 35
      }
    }
  }

  lifecycle {
    ignore_changes = [
      app_settings["STAGING_HOSTNAME"],
      app_settings["BASE_URL"],
      site_config[0].linux_fx_version
    ]
  }
}

# Fail
# ruleid: appservice-account-identity-registered
resource "azurerm_app_service" "bad_example" {
  name                = "example-app-service"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id
}
