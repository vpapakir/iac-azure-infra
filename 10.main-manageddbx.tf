# Resource Group using published atom (Databricks managed - read-only)
module "resourcegroup_manageddbx" {
  source  = "app.terraform.io/vpapakir/resourcegroup/atom"
  version = "0.0.2"

  name     = local.resource_groups.manageddbx.name
  location = local.resource_groups.manageddbx.location
  tags     = {}  # Don't try to manage tags on Databricks-managed RG

  # Prevent Terraform from trying to modify this managed resource
  lifecycle {
    ignore_changes = [
      tags,
      managed_by
    ]
  }
}