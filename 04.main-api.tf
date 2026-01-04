# Resource Group using published atom
module "resourcegroup_api" {
  source  = "app.terraform.io/vpapakir/resourcegroup/atom"
  version = "0.0.2"

  name     = local.resource_groups.api.name
  location = local.resource_groups.api.location
  tags     = local.resource_groups.api.tags
}