# Azure Infrastructure Consumer
# Consumes published atoms from Terraform Cloud registry

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

# Resource Group using published atom
module "resourcegroup_datalake" {
  source  = "app.terraform.io/vpapakir/resourcegroup/atom"
  version = "0.0.2"

  name     = var.resource_group_name_datalake
  location = var.location_datalake
  tags     = var.tags_datalake
}

# Resource Group using published atom
module "resourcegroup_gen" {
  source  = "app.terraform.io/vpapakir/resourcegroup/atom"
  version = "0.0.2"

  name     = var.resource_group_name_gen
  location = var.location_gen
  tags     = var.tags_datalake_gen
}