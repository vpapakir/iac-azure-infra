terraform {
  required_version = ">= 1.6.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "remote" {
    organization = "vpapakir"

    workspaces {
      prefix = "azure-infra-"
    }
  }
}