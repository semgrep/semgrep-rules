# fail
resource "azurerm_role_definition" "example" {
    name        = "my-custom-role"
    scope       = data.azurerm_subscription.primary.id
    description = "This is a custom role created via Terraform"

    permissions {
    # ruleid: azure-customrole-definition-subscription-owner
    actions     = ["*"]
    not_actions = []
    }

    assignable_scopes = [
    data.azurerm_subscription.primary.id
    ]
}

# fail
resource "azurerm_role_definition" "example" {
    name        = "my-custom-role"
    scope       = data.azurerm_subscription.primary.id
    description = "This is a custom role created via Terraform"

    permissions {
    # ruleid: azure-customrole-definition-subscription-owner
    actions     = ["*"]
    not_actions = []
    }

    assignable_scopes = [
    "/"
    ]
}

# fail
resource "azurerm_role_definition" "example" {
    name        = "my-custom-role"
    scope       = data.azurerm_subscription.primary.id
    description = "This is a custom role created via Terraform"

    permissions {
    # ruleid: azure-customrole-definition-subscription-owner
    actions     = ["*"]
    not_actions = []
    }
}

# pass
resource "azurerm_role_definition" "example" {
    name        = "my-custom-role"
    scope       = data.azurerm_subscription.primary.id
    description = "This is a custom role created via Terraform"

    permissions {
    actions     = [
    "Microsoft.Authorization/*/read",
        "Microsoft.Insights/alertRules/*",
        "Microsoft.Resources/deployments/write",
        "Microsoft.Resources/subscriptions/operationresults/read",
        "Microsoft.Resources/subscriptions/read",
        "Microsoft.Resources/subscriptions/resourceGroups/read",
        "Microsoft.Support/*"
        ]
    not_actions = []
    }

    assignable_scopes = [
    data.azurerm_subscription.primary.id
    ]
}
