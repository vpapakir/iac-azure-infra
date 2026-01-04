# Resource Group using published atom
module "resourcegroup_gen" {
  source  = "app.terraform.io/vpapakir/resourcegroup/atom"
  version = "0.0.2"

  name     = local.resource_groups.general.name
  location = local.resource_groups.general.location
  tags     = local.resource_groups.general.tags
}