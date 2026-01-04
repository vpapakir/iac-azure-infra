# Resource Group using published atom
module "resourcegroup_logicapp" {
  source  = "app.terraform.io/vpapakir/resourcegroup/atom"
  version = "0.0.2"

  name     = local.resource_groups.logicapp.name
  location = local.resource_groups.logicapp.location
  tags     = local.resource_groups.logicapp.tags
}