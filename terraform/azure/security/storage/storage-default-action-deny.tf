# pass
resource "azurerm_storage_account_network_rules" "good_example" {
  default_action             = "Deny"
  ip_rules                   = ["127.0.0.1"]
  virtual_network_subnet_ids = [azurerm_subnet.test.id]
  bypass                     = ["Metrics"]
}
# fail

# ruleid: storage-default-action-deny
resource "azurerm_storage_account_network_rules" "bad_example" {
  default_action             = "Allow"
  ip_rules                   = ["127.0.0.1"]
  virtual_network_subnet_ids = [azurerm_subnet.test.id]
  bypass                     = ["Metrics"]
}
