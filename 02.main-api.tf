# Resource Group using published atom
module "resourcegroup_api" {
  source  = "app.terraform.io/vpapakir/resourcegroup/atom"
  version = "0.0.2"

  name     = var.resource_group_name_api
  location = var.location_api
  tags     = var.tags_api
}