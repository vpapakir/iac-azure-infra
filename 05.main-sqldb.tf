# Resource Group using published atom
module "resourcegroup_sqldb" {
  source  = "app.terraform.io/vpapakir/resourcegroup/atom"
  version = "0.0.2"

  name     = local.resource_groups.sqldb.name
  location = local.resource_groups.sqldb.location
  tags     = local.resource_groups.sqldb.tags
}