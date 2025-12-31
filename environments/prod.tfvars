resource_group_name = "rg-weu-prod-datalake-001"
location           = "West Europe"
data_factory_name  = "adf-weu-prod-datalake-001"

data_factory_public_network_enabled = false
data_factory_managed_vnet_enabled   = true

tags = {
  Environment = "prod"
  Project     = "datalake"
  Owner       = "platform-team"
  CostCenter  = "engineering"
}