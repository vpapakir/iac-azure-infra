# Resource Group using published atom
module "resourcegroup_datalakestorage" {
  source  = "app.terraform.io/vpapakir/resourcegroup/atom"
  version = "0.0.2"

  name     = local.resource_groups.datalakestorage.name
  location = local.resource_groups.datalakestorage.location
  tags     = local.resource_groups.datalakestorage.tags
}