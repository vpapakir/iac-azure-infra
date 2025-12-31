variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "East US"
}

variable "data_factory_name" {
  description = "Name of the Azure Data Factory"
  type        = string
}

variable "data_factory_public_network_enabled" {
  description = "Enable public network access for Data Factory"
  type        = bool
  default     = true
}

variable "data_factory_managed_vnet_enabled" {
  description = "Enable managed virtual network for Data Factory"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}