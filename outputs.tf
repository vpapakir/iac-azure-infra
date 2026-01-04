# General Resource Group Outputs
output "gen" {
  description = "General resource group details"
  value = {
    id       = module.resourcegroup_gen.resource_group_id
    name     = module.resourcegroup_gen.resource_group_name
    location = module.resourcegroup_gen.location
  }
}

# Shared Resource Group Outputs
output "shared" {
  description = "Shared resource group details"
  value = {
    id       = module.resourcegroup_shared.resource_group_id
    name     = module.resourcegroup_shared.resource_group_name
    location = module.resourcegroup_shared.location
  }
}

# API Resource Group Outputs
output "api" {
  description = "API resource group details"
  value = {
    id       = module.resourcegroup_api.resource_group_id
    name     = module.resourcegroup_api.resource_group_name
    location = module.resourcegroup_api.location
  }
}

# SQL DB Resource Group Outputs
output "sqldb" {
  description = "SQL DB resource group details"
  value = {
    id       = module.resourcegroup_sqldb.resource_group_id
    name     = module.resourcegroup_sqldb.resource_group_name
    location = module.resourcegroup_sqldb.location
  }
}

# Data Integration Resource Group Outputs
output "dataintg" {
  description = "Data Integration resource group details"
  value = {
    id       = module.resourcegroup_dataintg.resource_group_id
    name     = module.resourcegroup_dataintg.resource_group_name
    location = module.resourcegroup_dataintg.location
  }
}

# Data Lake Resource Group Outputs
output "datalake" {
  description = "Data Lake resource group details"
  value = {
    id       = module.resourcegroup_datalake.resource_group_id
    name     = module.resourcegroup_datalake.resource_group_name
    location = module.resourcegroup_datalake.location
  }
}

# Data Lake Storage Resource Group Outputs
output "datalakestorage" {
  description = "Data Lake Storage resource group details"
  value = {
    id       = module.resourcegroup_datalakestorage.resource_group_id
    name     = module.resourcegroup_datalakestorage.resource_group_name
    location = module.resourcegroup_datalakestorage.location
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
    shared = {
      id       = module.resourcegroup_shared.resource_group_id
      name     = module.resourcegroup_shared.resource_group_name
      location = module.resourcegroup_shared.location
    }
    api = {
      id       = module.resourcegroup_api.resource_group_id
      name     = module.resourcegroup_api.resource_group_name
      location = module.resourcegroup_api.location
    }
    sqldb = {
      id       = module.resourcegroup_sqldb.resource_group_id
      name     = module.resourcegroup_sqldb.resource_group_name
      location = module.resourcegroup_sqldb.location
    }
    dataintg = {
      id       = module.resourcegroup_dataintg.resource_group_id
      name     = module.resourcegroup_dataintg.resource_group_name
      location = module.resourcegroup_dataintg.location
    }
    datalake = {
      id       = module.resourcegroup_datalake.resource_group_id
      name     = module.resourcegroup_datalake.resource_group_name
      location = module.resourcegroup_datalake.location
    }
    datalakestorage = {
      id       = module.resourcegroup_datalakestorage.resource_group_id
      name     = module.resourcegroup_datalakestorage.resource_group_name
      location = module.resourcegroup_datalakestorage.location
    }
  }
}