resource "azurerm_user_assigned_identity" "uai" {
  name                = "${var.aks_uai_name}"
  resource_group_name = var.resource_group_name
  location            = var.location
}

# give adequate role assignment for AKS user assigned identity
resource "azurerm_role_assignment" "roleassignment_sas_viya_principal_aks_private_dns_zone" {
  scope                = azurerm_private_dns_zone.pdns_aks.id
  role_definition_name = "Private DNS Zone Contributor"
  principal_id         = azurerm_user_assigned_identity.uai.principal_id
}

resource "azurerm_role_assignment" "roleassignment_sas_viya_principal_sas_viya_vnet" {
  scope                = data.azurerm_virtual_network.landing_zone_vnet.id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.uai.principal_id
}

resource "azurerm_role_assignment" "roleassignment_sas_viya_principal_aks_route_table" {
  scope                = data.azurerm_route_table.landing_zone_route_table.id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.uai.principal_id
}