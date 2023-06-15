# This project assumes that a vnet is alraedy in place

data "azurerm_virtual_network" "landing_zone_vnet" {
  name                = var.vnet_name
  resource_group_name = var.vnet_resource_group_name
}

data "azurerm_resource_group" "landing_zone_utility_rg" {
  name     = var.vnet_resource_group_name
}

data "azurerm_resource_group" "landing_zone_rg" {
  name     = var.resource_group_name
}

data "azurerm_route_table" "landing_zone_route_table" {
  name                = var.route_table_name
  resource_group_name = var.vnet_resource_group_name
}