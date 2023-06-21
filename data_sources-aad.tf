#region Azure AD
locals {
  azure_cloud_admin          = "Azure - Cloud Admins"
  azure_sasviya_cloud_admin  = "Azure - SAS Viya Cloud Admin"
  azure_sasviya_reader       = "Azure - SAS Viya Reader"
  azure_aks_user             = "Azure - AKS User"
  azure_vm_operator          = "Azure - VM Operator"
}

data "azuread_group" "azure_cloud_admin" {
  display_name = local.azure_cloud_admin
}
data "azuread_group" "azure_sasviya_cloud_admin" {
  display_name = local.azure_sasviya_cloud_admin
}
data "azuread_group" "azure_sasviya_reader" {
  display_name = local.azure_sasviya_reader
}
data "azuread_group" "azure_aks_user" {
  display_name = local.azure_aks_user
}
data "azuread_group" "azure_vm_operator" {
  display_name = local.azure_vm_operator
}
