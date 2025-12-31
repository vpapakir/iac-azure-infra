output "resource_group_gen_location" {
  description = "Location of the created resource group"
  value       = module.resourcegroup_gen.location
}

output "resource_group_datalake_location" {
  description = "Location of the created resource group"
  value       = module.resourcegroup_datalake.location
}