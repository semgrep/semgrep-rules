resource "azurerm_key_vault_secret" "good_example" {
  name         = "secret-sauce"
  value        = "qwerty"
  key_vault_id = azurerm_key_vault.example.id
  content_type = "password"
}

# ruleid: keyvault-content-type-for-secret
resource "azurerm_key_vault_secret" "bad_example" {
  name         = "secret-sauce"
  value        = "qwerty"
  key_vault_id = azurerm_key_vault.example.id
}
