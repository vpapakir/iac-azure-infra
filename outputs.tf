output "resource_group_id" {
  description = "ID of the created resource group"
  value       = module.resource_group.id
}

output "resource_group_name" {
  description = "Name of the created resource group"
  value       = module.resource_group.name
}

output "resource_group_location" {
  description = "Location of the created resource group"
  value       = module.resource_group.location
}

# Data Factory outputs (when module is enabled)
# output "data_factory_id" {
#   description = "ID of the created Data Factory"
#   value       = module.data_factory.id
# }

# output "data_factory_name" {
#   description = "Name of the created Data Factory"
#   value       = module.data_factory.name
# }