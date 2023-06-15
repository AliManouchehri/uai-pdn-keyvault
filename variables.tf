# Copyright © 2020-2023, SAS Institute Inc., Cary, NC, USA. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

## Global
variable "client_id" {
  description = "The Client ID for the Service Principal"
  type        = string
  default     = ""
}

variable "client_secret" {
  description = "The Client Secret for the Service Principal."
  type        = string
  default     = ""
}

variable "subscription_id" {
  description = "The ID of the Subscription."
  type        = string
}

variable "tenant_id" {
  description = "The ID of the Tenant to which the subscription belongs"
  type        = string
}

variable "use_msi" {
  description = "Use Managed Identity for Authentication (Azure VMs only)"
  type        = bool
  default     = false
}

variable "partner_id" {
  description = "A GUID/UUID that is registered with Microsoft to facilitate partner resource usage attribution"
  type        = string
  default     = "5d27f3ae-e49c-4dea-9aa3-b44e4750cd8c"
}

variable "location" {
  description = "The Azure Region to provision all resources in this script"
  type        = string
  default     = "eastus"
}

variable "prefix" {
  description = "A prefix used in the name for all cloud resources created by this script. The prefix string must start with lowercase letter and contain only lowercase alphanumeric characters and hyphen or dash(-), but can not start or end with '-'."
  type        = string

  validation {
    condition     = can(regex("^[a-z][-0-9a-z]*[0-9a-z]$", var.prefix)) && length(var.prefix) > 2 && length(var.prefix) < 21
    error_message = "ERROR: Value of 'prefix'\n * must start with lowercase letter and at most be 20 characters in length\n * can only contain lowercase letters, numbers, and hyphen or dash(-), but can't start or end with '-'."
  }
}

variable "vnet_name" {
  description = "Name of pre-exising vnet. Leave blank to have one created"
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "Name of a pre-exising resource group containing the BYO vnet resource. Leave blank if you are not using a BYO vnet or if the BYO vnet is co-located with the SAS Viya4 AKS cluster."
  type        = string
  default     = null
}

variable "vnet_resource_group_name" {
  description = "Name of a pre-exising resource group containing the BYO vnet resource. Leave blank if you are not using a BYO vnet or if the BYO vnet is co-located with the SAS Viya4 AKS cluster."
  type        = string
  default     = null
}

variable "aks_uai_name" {
  description = "User assigned identity name"
  type        = string
  default     = null
}

variable "tags" {
  description = "Map of common tags to be placed on the Resources"
  type        = map(any)
  default     = {}
}

variable "route_table_name" {
  description = "Route table assigned to AKS subnet"
  type        = string
  default     = null
}
