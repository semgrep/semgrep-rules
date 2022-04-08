# fail
# ruleid: azure-monitor-log-profile-retention-days
resource "azurerm_monitor_log_profile" "example" {
    name = "default"
    categories = [
    "Action",
    "Delete",
    "Write",
    ]
    locations = [
    "westus",
    "global",
    ]
    retention_policy {
    enabled = true
    days    = 7
    }
}

# fail
# ruleid: azure-monitor-log-profile-retention-days
resource "azurerm_monitor_log_profile" "example" {
    name = "default"
    categories = [
    "Action",
    "Delete",
    "Write",
    ]
    locations = [
    "westus",
    "global",
    ]
}

# pass
resource "azurerm_monitor_log_profile" "example" {
    name = "default"
    categories = [
    "Action",
    "Delete",
    "Write",
    ]
    locations = [
    "westus",
    "global",
    ]
    retention_policy {
    enabled = false
    days    = 0
    }
}

# pass
resource "azurerm_monitor_log_profile" "example" {
    name = "default"
    categories = [
    "Action",
    "Delete",
    "Write",
    ]
    locations = [
    "westus",
    "global",
    ]
    retention_policy {
    enabled = true
    days    = 365
    }
}