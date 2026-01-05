# Resource Group using published atom
module "resourcegroup_manageddbx" {
  source  = "app.terraform.io/vpapakir/resourcegroup/atom"
  version = "0.0.2"

  name     = local.resource_groups.manageddbx.name
  location = local.resource_groups.manageddbx.location
  tags     = local.resource_groups.manageddbx.tags
}