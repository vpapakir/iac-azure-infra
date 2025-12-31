terraform {
  required_version = ">= 1.14.0"
  cloud {
    organization = "vpapakir"

    workspaces {
      name = "azure-infra-${TF_WORKSPACE}"
    }
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}