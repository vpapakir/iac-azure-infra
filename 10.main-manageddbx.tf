# Databricks-managed resource group - use direct resource instead of atom
resource "azurerm_resource_group" "manageddbx" {
  name     = local.resource_groups.manageddbx.name
  location = local.resource_groups.manageddbx.location
  
  # Keep existing Databricks management
  managed_by = "/subscriptions/52ce15a5-9158-46b9-ab49-2b932ed43df9/resourceGroups/rg-weu-dev-datalake-001/providers/Microsoft.Databricks/workspaces/dbx-weu-dev-datalake-001"
  
  tags = {
    MLWorkspaceLinkUpdateTime = "04/12/2024 08:31:26 +00:00"
  }
  
  lifecycle {
    ignore_changes = [
      managed_by,
      tags
    ]
  }
}