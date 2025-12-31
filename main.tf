# Azure Infrastructure Consumer
# Consumes published atoms from Terraform Cloud registry

terraform {
  required_version = ">= 1.6.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Resource Group using published atom
module "resource_group" {
  source  = "app.terraform.io/vpapakir/resourcegroup/azure"
  version = "~> 0.0.1"

  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
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