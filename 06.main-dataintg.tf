# Resource Group using published atom
module "resourcegroup_dataintg" {
  source  = "app.terraform.io/vpapakir/resourcegroup/atom"
  version = "0.0.2"

  name     = local.resource_groups.dataintg.name
  location = local.resource_groups.dataintg.location
  tags     = local.resource_groups.dataintg.tags
}