# fail
# ruleid: azure-automation-encrypted
resource "azurerm_automation_variable_string" "example" {
    name                    = "tfex-example-var"
    resource_group_name     = azurerm_resource_group.example.name
    automation_account_name = azurerm_automation_account.example.name
    value                   = "Hello, Terraform Basic Test."
    encrypted               = false
}

# fail
# ruleid: azure-automation-encrypted
resource "azurerm_automation_variable_datetime" "example" {
    name                    = "tfex-example-var"
    resource_group_name     = azurerm_resource_group.example.name
    automation_account_name = azurerm_automation_account.example.name
    value                   = "Hello, Terraform Basic Test."
}

# pass
resource "azurerm_automation_variable_int" "example" {
    name                    = "tfex-example-var"
    resource_group_name     = azurerm_resource_group.example.name
    automation_account_name = azurerm_automation_account.example.name
    value                   = "Hello, Terraform Basic Test."
    encrypted               = true
}