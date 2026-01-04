# import {
#   to = module.resourcegroup_gen.azurerm_resource_group.main
#   id = "/subscriptions/52ce15a5-9158-46b9-ab49-2b932ed43df9/resourceGroups/rg-weu-dev-gen-001"
# }

# import {
#   to = module.resourcegroup_intg.azurerm_resource_group.main
#   id = "/subscriptions/52ce15a5-9158-46b9-ab49-2b932ed43df9/resourceGroups/rg-weu-dev-intg-001"
# }

import {
  to = module.resourcegroup_shared.azurerm_resource_group.main
  id = "/subscriptions/52ce15a5-9158-46b9-ab49-2b932ed43df9/resourceGroups/rg-weu-dev-shared-001"
}

import {
  to = module.resourcegroup_api.azurerm_resource_group.main
  id = "/subscriptions/52ce15a5-9158-46b9-ab49-2b932ed43df9/resourceGroups/rg-weu-dev-api-001"
}

import {
  to = module.resourcegroup_sqldb.azurerm_resource_group.main
  id = "/subscriptions/52ce15a5-9158-46b9-ab49-2b932ed43df9/resourceGroups/rg-weu-dev-sqldb-001"
}

import {
  to = module.resourcegroup_dataintg.azurerm_resource_group.main
  id = "/subscriptions/52ce15a5-9158-46b9-ab49-2b932ed43df9/resourceGroups/rg-weu-dev-dataintg-001"
}

import {
  to = module.resourcegroup_datalake.azurerm_resource_group.main
  id = "/subscriptions/52ce15a5-9158-46b9-ab49-2b932ed43df9/resourceGroups/rg-weu-dev-datalake-001"
}

import {
  to = module.resourcegroup_datalakestorage.azurerm_resource_group.main
  id = "/subscriptions/52ce15a5-9158-46b9-ab49-2b932ed43df9/resourceGroups/rg-weu-dev-datalakestorage-001"
}

