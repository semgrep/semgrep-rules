# pass

resource "azurerm_storage_account" "good_example" {
  name                     = "storageaccountname"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  min_tls_version          = "TLS1_2"
}

# fail
# ruleid: storage-use-secure-tls-policy
resource "azurerm_storage_account" "bad_example" {
  name                     = "storageaccountname"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
}

# ruleid: storage-use-secure-tls-policy
resource "azurerm_storage_account" "bad_example" {
  name                     = "storageaccountname"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  min_tls_version          = "TLS1_1"
}

# ruleid: storage-use-secure-tls-policy
resource "azurerm_storage_account" "bad_example" {
  name                     = "storageaccountname"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  min_tls_version          = "TLS1_0"
}
