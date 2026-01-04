# Resource Group using published atom
module "resourcegroup_shared" {
  source  = "app.terraform.io/vpapakir/resourcegroup/atom"
  version = "0.0.2"

  name     = local.resource_groups.shared.name
  location = local.resource_groups.shared.location
  tags     = local.resource_groups.shared.tags
}