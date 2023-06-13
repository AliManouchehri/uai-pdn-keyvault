
#client_id       = ""
#client_secret   = ""
subscription_id = "fb53250a-831b-4109-bfb2-d2bb6fe8f03d"
tenant_id       = "018a7b63-67e8-45fc-85f4-f0a07b6cda2f"

# ****************  REQUIRED VARIABLES  ****************
# These required variables' values MUST be provided by the User
prefix         = "dev2"
location       = "canadacentral" # e.g., "eastus2"
# ****************  REQUIRED VARIABLES  ****************

# Bring your own existing networking resources
vnet_name                = "vn-dtb-adacs-sasviya-dt"           
resource_group_name      = "lz-client-dtb-adacs-sasviya-dt" 
vnet_resource_group_name = "Utility" 
aks_uai_name             = "uami-dtb-adacs-sasviya-aks-1" 

# Tags for all taggable items in your cluster.
tags = {
  "ApplicationName"    = "SAS Viya",
  "ClientOrganization" = "csb",
  "ContactEmail"       = "ali@manouchehri.ca",
  "CostCenter"         = "iFathom",
  "CostRecovery"       = "No",
  "CreatedBy"          = "Ali Manouchehri",
  "Environment"        = "Dev2",
  "ProjectContact"     = "Ali Manouchehri",
  "ProjectName"        = "SAS Viya",
  "Sensitivity"        = "ProtectedB",
  "Zone"               = "PAZ,ARZ,DRZ"
} 
