resource_group_name = "rg-weu-dev-datalake-001"
location           = "West Europe"
data_factory_name  = "adf-weu-dev-datalake-001"

data_factory_public_network_enabled = true
data_factory_managed_vnet_enabled   = true

tags = {
  Environment = "dev"
  Project     = "datalake"
  Owner       = "platform-team"
  CostCenter  = "engineering"
}