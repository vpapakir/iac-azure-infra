# Resource Group using published atom
module "resourcegroup_datalake" {
  source  = "app.terraform.io/vpapakir/resourcegroup/atom"
  version = "0.0.2"

  name     = local.resource_groups.datalake.name
  location = local.resource_groups.datalake.location
  tags     = local.resource_groups.datalake.tags
}