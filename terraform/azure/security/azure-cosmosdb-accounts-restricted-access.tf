# fail
# ruleid: azure-cosmosdb-accounts-restricted-access
resource "azurerm_cosmosdb_account" "db" {
    name                = "tfex-cosmos-db-${random_integer.ri.result}"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    offer_type          = "Standard"
    kind                = "GlobalDocumentDB"
    is_virtual_network_filter_enabled = true

    enable_automatic_failover = true

    capabilities {
    name = "EnableAggregationPipeline"
    }

    capabilities {
    name = "mongoEnableDocLevelTTL"
    }

    capabilities {
    name = "MongoDBv3.4"
    }

    consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 10
    max_staleness_prefix    = 200
    }

    geo_location {
    location          = var.failover_location
    failover_priority = 1
    }

    geo_location {
    location          = azurerm_resource_group.rg.location
    failover_priority = 0
    }
}

# fail
# ruleid: azure-cosmosdb-accounts-restricted-access
resource "azurerm_cosmosdb_account" "db" {
    name                = "tfex-cosmos-db-${random_integer.ri.result}"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    offer_type          = "Standard"
    kind                = "GlobalDocumentDB"
    public_network_access_enabled = true
    is_virtual_network_filter_enabled = false

    enable_automatic_failover = true

    capabilities {
      name = "EnableAggregationPipeline"
    }

    capabilities {
      name = "mongoEnableDocLevelTTL"
    }

    capabilities {
      name = "MongoDBv3.4"
    }

    consistency_policy {
      consistency_level       = "BoundedStaleness"
      max_interval_in_seconds = 10
      max_staleness_prefix    = 200
    }

    geo_location {
      location          = var.failover_location
      failover_priority = 1
    }

    geo_location {
      location          = azurerm_resource_group.rg.location
      failover_priority = 0
    }
}

# fail
# ruleid: azure-cosmosdb-accounts-restricted-access
resource "azurerm_cosmosdb_account" "db" {
    name                = "tfex-cosmos-db-${random_integer.ri.result}"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    offer_type          = "Standard"
    kind                = "GlobalDocumentDB"
    is_virtual_network_filter_enabled = false

    enable_automatic_failover = true

    capabilities {
      name = "EnableAggregationPipeline"
    }

    capabilities {
      name = "mongoEnableDocLevelTTL"
    }

    capabilities {
      name = "MongoDBv3.4"
    }

    consistency_policy {
      consistency_level       = "BoundedStaleness"
      max_interval_in_seconds = 10
      max_staleness_prefix    = 200
    }

    geo_location {
      location          = var.failover_location
      failover_priority = 1
    }

    geo_location {
      location          = azurerm_resource_group.rg.location
      failover_priority = 0
    }
}

# fail
# ruleid: azure-cosmosdb-accounts-restricted-access
resource "azurerm_cosmosdb_account" "db" {
    name                = "tfex-cosmos-db-${random_integer.ri.result}"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    offer_type          = "Standard"
    kind                = "GlobalDocumentDB"
    is_virtual_network_filter_enabled = false
    virtual_network_rule = azurerm_firewall_network_rule_collection.example

    enable_automatic_failover = true

    capabilities {
        name = "EnableAggregationPipeline"
    }

    capabilities {
        name = "mongoEnableDocLevelTTL"
    }

    capabilities {
        name = "MongoDBv3.4"
    }

    consistency_policy {
        consistency_level       = "BoundedStaleness"
        max_interval_in_seconds = 10
        max_staleness_prefix    = 200
    }

    geo_location {
        location          = var.failover_location
        failover_priority = 1
    }

    geo_location {
        location          = azurerm_resource_group.rg.location
        failover_priority = 0
    }
}

# fail
# ruleid: azure-cosmosdb-accounts-restricted-access
resource "azurerm_cosmosdb_account" "db" {
    name                = "tfex-cosmos-db-${random_integer.ri.result}"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    offer_type          = "Standard"
    kind                = "GlobalDocumentDB"
    public_network_access_enabled = true
    
    ip_range_filter = ["192.0.0.1"]

    enable_automatic_failover = true

    capabilities {
      name = "EnableAggregationPipeline"
    }

    capabilities {
      name = "mongoEnableDocLevelTTL"
    }

    capabilities {
      name = "MongoDBv3.4"
    }

    consistency_policy {
      consistency_level       = "BoundedStaleness"
      max_interval_in_seconds = 10
      max_staleness_prefix    = 200
    }

    geo_location {
      location          = var.failover_location
      failover_priority = 1
    }

    geo_location {
      location          = azurerm_resource_group.rg.location
      failover_priority = 0
    }
}

# pass
resource "azurerm_cosmosdb_account" "db" {
    name                = "tfex-cosmos-db-${random_integer.ri.result}"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    offer_type          = "Standard"
    kind                = "GlobalDocumentDB"
    public_network_access_enabled = false

    enable_automatic_failover = true

    capabilities {
      name = "EnableAggregationPipeline"
    }

    capabilities {
      name = "mongoEnableDocLevelTTL"
    }

    capabilities {
      name = "MongoDBv3.4"
    }

    consistency_policy {
      consistency_level       = "BoundedStaleness"
      max_interval_in_seconds = 10
      max_staleness_prefix    = 200
    }

    geo_location {
      location          = var.failover_location
      failover_priority = 1
    }

    geo_location {
      location          = azurerm_resource_group.rg.location
      failover_priority = 0
    }
}

# pass
resource "azurerm_firewall_network_rule_collection" "example" {
    name                = "testcollection"
    azure_firewall_name = azurerm_firewall.example.name
    resource_group_name = azurerm_resource_group.example.name
    priority            = 100
    action              = "Allow"
  
    rule {
      name = "testrule"
  
      source_addresses = [
        "10.0.0.0/16",
      ]
  
      destination_ports = [
        "53",
      ]
  
      destination_addresses = [
        "8.8.8.8",
        "8.8.4.4",
      ]
  
      protocols = [
        "TCP",
        "UDP",
      ]
    }
  }
resource "azurerm_cosmosdb_account" "db" {
    name                = "tfex-cosmos-db-${random_integer.ri.result}"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    offer_type          = "Standard"
    kind                = "GlobalDocumentDB"
    is_virtual_network_filter_enabled = true
    virtual_network_rule = azurerm_firewall_network_rule_collection.example

    enable_automatic_failover = true

    capabilities {
        name = "EnableAggregationPipeline"
    }

    capabilities {
        name = "mongoEnableDocLevelTTL"
    }

    capabilities {
        name = "MongoDBv3.4"
    }

    consistency_policy {
        consistency_level       = "BoundedStaleness"
        max_interval_in_seconds = 10
        max_staleness_prefix    = 200
    }

    geo_location {
        location          = var.failover_location
        failover_priority = 1
    }

    geo_location {
        location          = azurerm_resource_group.rg.location
        failover_priority = 0
    }
}

# pass
resource "azurerm_cosmosdb_account" "db" {
    name                = "tfex-cosmos-db-${random_integer.ri.result}"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    offer_type          = "Standard"
    kind                = "GlobalDocumentDB"
    public_network_access_enabled = false
    is_virtual_network_filter_enabled = true
    virtual_network_rule = azurerm_firewall_network_rule_collection.example

    enable_automatic_failover = true

    capabilities {
        name = "EnableAggregationPipeline"
    }

    capabilities {
        name = "mongoEnableDocLevelTTL"
    }

    capabilities {
        name = "MongoDBv3.4"
    }

    consistency_policy {
        consistency_level       = "BoundedStaleness"
        max_interval_in_seconds = 10
        max_staleness_prefix    = 200
    }

    geo_location {
        location          = var.failover_location
        failover_priority = 1
    }

    geo_location {
        location          = azurerm_resource_group.rg.location
        failover_priority = 0
    }
}

# pass
resource "azurerm_cosmosdb_account" "db" {
    name                = "tfex-cosmos-db-${random_integer.ri.result}"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    offer_type          = "Standard"
    kind                = "GlobalDocumentDB"
    is_virtual_network_filter_enabled = true
    ip_range_filter = ["192.0.0.1"]

    enable_automatic_failover = true

    capabilities {
        name = "EnableAggregationPipeline"
    }

    capabilities {
        name = "mongoEnableDocLevelTTL"
    }

    capabilities {
        name = "MongoDBv3.4"
    }

    consistency_policy {
        consistency_level       = "BoundedStaleness"
        max_interval_in_seconds = 10
        max_staleness_prefix    = 200
    }

    geo_location {
        location          = var.failover_location
        failover_priority = 1
    }

    geo_location {
        location          = azurerm_resource_group.rg.location
        failover_priority = 0
    }
}