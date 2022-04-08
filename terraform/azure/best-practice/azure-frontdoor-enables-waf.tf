# fail
# ruleid: azure-frontdoor-enables-waf
resource "azurerm_frontdoor" "example" {
    name                                         = "example-FrontDoor"
    location                                     = "EastUS2"
    resource_group_name                          = azurerm_resource_group.example.name
    enforce_backend_pools_certificate_name_check = false

    routing_rule {
    name               = "exampleRoutingRule1"
    accepted_protocols = ["Http", "Https"]
    patterns_to_match  = ["/*"]
    frontend_endpoints = ["exampleFrontendEndpoint1"]
    forwarding_configuration {
        forwarding_protocol = "MatchRequest"
        backend_pool_name   = "exampleBackendBing"
    }
    }

    backend_pool_load_balancing {
    name = "exampleLoadBalancingSettings1"
    }

    backend_pool_health_probe {
    name = "exampleHealthProbeSetting1"
    }

    backend_pool {
    name = "exampleBackendBing"
    backend {
        host_header = "www.bing.com"
        address     = "www.bing.com"
        http_port   = 80
        https_port  = 443
    }

    load_balancing_name = "exampleLoadBalancingSettings1"
    health_probe_name   = "exampleHealthProbeSetting1"
    }

    frontend_endpoint {
    name                              = "exampleFrontendEndpoint1"
    host_name                         = "example-FrontDoor.azurefd.net"
    custom_https_provisioning_enabled = false
    }
}

# pass
resource "azurerm_frontdoor" "example" {
    name                                         = "example-FrontDoor"
    location                                     = "EastUS2"
    resource_group_name                          = azurerm_resource_group.example.name
    enforce_backend_pools_certificate_name_check = false
    web_application_firewall_policy_link_id = "this_is_id"

    routing_rule {
    name               = "exampleRoutingRule1"
    accepted_protocols = ["Http", "Https"]
    patterns_to_match  = ["/*"]
    frontend_endpoints = ["exampleFrontendEndpoint1"]
    forwarding_configuration {
        forwarding_protocol = "MatchRequest"
        backend_pool_name   = "exampleBackendBing"
    }
    }

    backend_pool_load_balancing {
    name = "exampleLoadBalancingSettings1"
    }

    backend_pool_health_probe {
    name = "exampleHealthProbeSetting1"
    }

    backend_pool {
    name = "exampleBackendBing"
    backend {
        host_header = "www.bing.com"
        address     = "www.bing.com"
        http_port   = 80
        https_port  = 443
    }

    load_balancing_name = "exampleLoadBalancingSettings1"
    health_probe_name   = "exampleHealthProbeSetting1"
    }

    frontend_endpoint {
    name                              = "exampleFrontendEndpoint1"
    host_name                         = "example-FrontDoor.azurefd.net"
    custom_https_provisioning_enabled = false
    }
}