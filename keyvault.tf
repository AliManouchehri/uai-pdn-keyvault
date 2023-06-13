resource "azurerm_key_vault" "kv_sas_viya" {
  name                = "${var.prefix}-kv-sasviya"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "standard"
  tenant_id           = var.tenant_id

  network_acls {
    bypass         = "AzureServices"
    default_action = "Deny"
    ip_rules = [
      "174.112.195.55",
    ]
  }

  purge_protection_enabled   = true
  soft_delete_retention_days = 60
  tags                       = var.tags
}