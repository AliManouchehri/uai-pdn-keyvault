provider "azurerm" {
  alias           = "p"
  subscription_id = var.subscription_id
  features {}
}

resource "azurerm_private_dns_zone" "pdns_keyvault" {
  provider            = azurerm.p
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone" "pdns_aks" {
  provider            = azurerm.p
  name                = "privatelink.canadacentral.azmk8s.io"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone" "flexpsql" {
  provider            = azurerm.p
  name                = "privatelink.postgres.database.azure.com"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "pdns_keyvault_vnet_link" {
  name                  = "pdns_keyvault_vnet_link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = "privatelink.vaultcore.azure.net"
  virtual_network_id    = data.azurerm_virtual_network.landing_zone_vnet.id

  depends_on = [azurerm_private_dns_zone.pdns_keyvault]
}

resource "azurerm_private_dns_zone_virtual_network_link" "pdns_aks_vnet_link" {
  name                  = "pdns_pdns_aks_vnet_link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = "privatelink.canadacentral.azmk8s.io"
  virtual_network_id    = data.azurerm_virtual_network.landing_zone_vnet.id

  depends_on = [azurerm_private_dns_zone.pdns_aks]
}

resource "azurerm_private_dns_zone_virtual_network_link" "pdns_flexpsql_vnet_link" {
  name                  = "pdns_flexpsql_vnet_link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = "privatelink.postgres.database.azure.com"
  virtual_network_id    = data.azurerm_virtual_network.landing_zone_vnet.id

  depends_on = [azurerm_private_dns_zone.flexpsql]
}