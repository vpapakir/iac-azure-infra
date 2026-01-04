# General Resource Group Outputs
output "gen" {
  description = "General resource group details"
  value = {
    id       = module.resourcegroup_gen.resource_group_id
    name     = module.resourcegroup_gen.resource_group_name
    location = module.resourcegroup_gen.location
  }
}

# Integration Resource Group Outputs
output "intg" {
  description = "Integration resource group details"
  value = {
    id       = module.resourcegroup_intg.resource_group_id
    name     = module.resourcegroup_intg.resource_group_name
    location = module.resourcegroup_intg.location
  }
}

# Cross-reference outputs for other modules
output "resource_groups" {
  description = "All resource groups for cross-referencing"
  value = {
    gen = {
      id       = module.resourcegroup_gen.resource_group_id
      name     = module.resourcegroup_gen.resource_group_name
      location = module.resourcegroup_gen.location
    }
    intg = {
      id       = module.resourcegroup_intg.resource_group_id
      name     = module.resourcegroup_intg.resource_group_name
      location = module.resourcegroup_intg.location
    }
  }
}