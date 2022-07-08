# fail
# ruleid: azure-redis-cache-public-network-access-enabled
resource "azurerm_redis_cache" "example" {
    name                = "example-cache"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    capacity            = 2
    family              = "C"
    sku_name            = "Standard"
    enable_non_ssl_port = false
    minimum_tls_version = "1.2"
    public_network_access_enabled  = true
    redis_configuration {
    }
}

# fail
# ruleid: azure-redis-cache-public-network-access-enabled
resource "azurerm_redis_cache" "example" {
    name                = "example-cache"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    capacity            = 2
    family              = "C"
    sku_name            = "Standard"
    enable_non_ssl_port = false
    minimum_tls_version = "1.2"

    redis_configuration {
    }
}

# pass
resource "azurerm_redis_cache" "example" {
    name                = "example-cache"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    capacity            = 2
    family              = "C"
    sku_name            = "Standard"
    enable_non_ssl_port = false
    minimum_tls_version = "1.2"
    public_network_access_enabled  = false

    redis_configuration {
    }
}