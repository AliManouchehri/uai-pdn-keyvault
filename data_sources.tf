data "azurerm_virtual_network" "landing_zone_vnet" {
  name                = var.vnet_name
  resource_group_name = var.vnet_resource_group_name
}