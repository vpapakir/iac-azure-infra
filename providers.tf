# Azure Infrastructure Consumer
# Consumes published atoms from Terraform Cloud registry

provider "azurerm" {
  features {}
  skip_provider_registration = true
}