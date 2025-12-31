output "resource_group_id" {
  description = "ID of the created resource group"
  value       = module.resourcegroup.id
}

output "resource_group_name" {
  description = "Name of the created resource group"
  value       = module.resourcegroup.name
}

output "resource_group_location" {
  description = "Location of the created resource group"
  value       = module.resourcegroup.location
}