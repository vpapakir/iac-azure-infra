# Resource Group using published atom
module "resourcegroup_gen" {
  source  = "app.terraform.io/vpapakir/resourcegroup/atom"
  version = "0.0.2"

  name     = var.resource_group_name_gen
  location = var.location_gen
  tags     = var.tags_gen
}