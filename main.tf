# Azure Infrastructure Consumer
# Consumes published atoms from Terraform Cloud registry

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

# Resource Group using published atom
module "resourcegroup" {
  source  = "app.terraform.io/vpapakir/resourcegroup/atom"
  version = "0.0.2"

  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}