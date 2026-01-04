# General Resource Group Outputs
output "gen" {
  description = "General resource group details"
  value = {
    id       = module.resourcegroup_gen.id
    name     = module.resourcegroup_gen.name
    location = module.resourcegroup_gen.location
    tags     = module.resourcegroup_gen.tags
  }
}

# Integration Resource Group Outputs
output "intg" {
  description = "Integration resource group details"
  value = {
    id       = module.resourcegroup_intg.id
    name     = module.resourcegroup_intg.name
    location = module.resourcegroup_intg.location
    tags     = module.resourcegroup_intg.tags
  }
}

# Cross-reference outputs for other modules
output "resource_groups" {
  description = "All resource groups for cross-referencing"
  value = {
    gen = {
      id       = module.resourcegroup_gen.id
      name     = module.resourcegroup_gen.name
      location = module.resourcegroup_gen.location
    }
    intg = {
      id       = module.resourcegroup_intg.id
      name     = module.resourcegroup_intg.name
      location = module.resourcegroup_intg.location
    }
  }
}