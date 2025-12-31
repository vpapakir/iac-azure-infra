# Azure Infrastructure Consumer
# Consumes published atoms from Terraform Cloud registry

provider "azurerm" {
  features {}
}

# Resource Group using published atom
module "resourcegroup" {
  source  = "app.terraform.io/vpapakir/resourcegroup/atom"
  version = "0.0.1"

  name = var.resource_group_name
  #  location = var.location
  #  tags     = var.tags
}

# Data Factory using published atom (when available)
# module "data_factory" {
#   source  = "app.terraform.io/vpapakir/datafactory/azure"
#   version = "~> 1.0"
#   
#   name                = var.data_factory_name
#   location            = var.location
#   resource_group_name = module.resource_group.name
#   
#   public_network_enabled          = var.data_factory_public_network_enabled
#   managed_virtual_network_enabled = var.data_factory_managed_vnet_enabled
#   
#   tags = var.tags
# }