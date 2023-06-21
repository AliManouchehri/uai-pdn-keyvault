resource "azurerm_key_vault" "kv_sas_viya" {
  name                = "${var.prefix}-kv-sasviya"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "standard"
  tenant_id           = var.tenant_id

  network_acls {
    bypass         = "AzureServices"
    default_action = "Deny"
    virtual_network_subnet_ids = []
    ip_rules = var.ip_rules
  }

  purge_protection_enabled   = true
  soft_delete_retention_days = 60      # After the initial creation, this value cannot be changed
  tags                       = var.tags
}

resource "azurerm_key_vault_access_policy" "kv_access_policy_cloud_admins" {
  key_vault_id = azurerm_key_vault.kv_sas_viya.id
  tenant_id    = var.tenant_id
  object_id    = data.azuread_group.azure_sasviya_cloud_admin.object_id

  certificate_permissions = [
    "Get",
    "List",
    "Update",
    "Create",
    "Import",
    "Delete",
    "Recover",
    "Backup",
    "Restore",
    "ManageContacts",
    "ManageIssuers",
    "GetIssuers",
    "ListIssuers",
    "SetIssuers",
    "DeleteIssuers",
  ]

  key_permissions = [
    "Get",
    "List",
    "Update",
    "Create",
    "Import",
    "Delete",
    "Recover",
    "Backup",
    "Restore",
  ]

  secret_permissions = [
    "Get",
    "List",
    "Set",
    "Delete",
    "Recover",
    "Backup",
    "Restore",
  ]
}

resource "azurerm_private_endpoint" "pe_keyvault" {
  name                = "pe-${azurerm_key_vault.kv_sas_viya.name}"
  resource_group_name = data.azurerm_resource_group.landing_zone_utility_rg.name
  location            = data.azurerm_resource_group.landing_zone_utility_rg.location
  subnet_id           = data.azurerm_subnet.sn_misc.id

  private_dns_zone_group {
    name = "default"
    private_dns_zone_ids = [
      azurerm_private_dns_zone.pdns_keyvault.id
    ]
  }

  private_service_connection {
    name                           = "pe-${azurerm_key_vault.kv_sas_viya.name}"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_key_vault.kv_sas_viya.id
    subresource_names = [
      "vault"
    ]
  }
  tags = data.azurerm_resource_group.landing_zone_rg.tags
}