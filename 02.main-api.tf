# Resource Group using published atom
module "resourcegroup_intg" {
  source  = "app.terraform.io/vpapakir/resourcegroup/atom"
  version = "0.0.2"

  name     = var.resource_group_name_intg
  location = var.location_intg
  tags     = var.tags_intg
}