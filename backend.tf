terraform {
  required_version = ">= 1.6.0"
  cloud {
    organization = "vpapakir"

    workspaces {
      prefix = "azure-infra-"
    }
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}