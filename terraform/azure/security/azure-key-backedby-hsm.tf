# fail
# ruleid: azure-key-backedby-hsm
resource "azurerm_key_vault_key" "generated" {
    name         = "generated-certificate"
    key_vault_id = azurerm_key_vault.example.id
    key_type     = "RSA"
    key_size     = 2048

    key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
    ]
}

# pass
resource "azurerm_key_vault_key" "generated" {
    name         = "generated-certificate"
    key_vault_id = azurerm_key_vault.example.id
    key_type     = "EC-HSM"
    key_size     = 2048

    key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
    ]
    expiration_date = "2020-12-30T20:00:00Z"
}

# pass
resource "azurerm_key_vault_key" "generated" {
    name         = "generated-certificate"
    key_vault_id = azurerm_key_vault.example.id
    key_type     = "RSA-HSM"
    key_size     = 2048

    key_opts = [
      "decrypt",
      "encrypt",
      "sign",
      "unwrapKey",
      "verify",
      "wrapKey",
    ]
    expiration_date = "2020-12-30T20:00:00Z"
}