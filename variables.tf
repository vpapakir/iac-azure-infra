variable "resource_group_name_api" {
  description = "Name of the Azure resource group"
  type        = string
}

variable "location_api" {
  description = "Azure region for resources"
  type        = string
  default     = "West Europe"
}

variable "tags_api" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "resource_group_name_gen" {
  description = "Name of the Azure resource group"
  type        = string
}

variable "location_gen" {
  description = "Azure region for resources"
  type        = string
  default     = "West Europe"
}

variable "tags_gen" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}