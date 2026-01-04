# Naming Convention System
locals {
  # Location abbreviations
  location_map = {
    "West Europe"  = "weu"
    "East US"      = "eus"
    "North Europe" = "neu"
    "UK South"     = "uks"
    "Central US"   = "cus"
  }

  # Environment abbreviations
  env_map = {
    "dev"     = "dev"
    "staging" = "stg"
    "prod"    = "prd"
  }

  # Resource type prefixes (Azure CAF compliant)
  resource_prefixes = {
    resource_group         = "rg"
    storage_account        = "st"
    key_vault              = "kv"
    virtual_network        = "vnet"
    subnet                 = "snet"
    network_security_group = "nsg"
    virtual_machine        = "vm"
    app_service            = "app"
    function_app           = "func"
    cosmos_db              = "cosmos"
    sql_server             = "sql"
    log_analytics          = "log"
  }

  # Naming convention function
  naming = {
    # Standard pattern: {prefix}-{location}-{environment}-{purpose}-{instance}
    standard = {
      for combo in setproduct(
        keys(local.resource_prefixes),
        keys(local.location_map),
        keys(local.env_map),
        ["gen", "intg", "data", "net", "sec"],
        range(1, 100)
        ) : "${combo[0]}-${combo[1]}-${combo[2]}-${combo[3]}-${combo[4]}" => {
        prefix      = local.resource_prefixes[combo[0]]
        location    = combo[1]
        environment = combo[2]
        purpose     = combo[3]
        instance    = combo[4]
        full_name   = "${local.resource_prefixes[combo[0]]}-${local.location_map[combo[1]]}-${local.env_map[combo[2]]}-${combo[3]}-${format("%03d", combo[4])}"
      }
    }
  }

  # Helper function to generate names
  generate_name = {
    resource_group = {
      gen  = "${local.resource_prefixes.resource_group}-${local.location_map[local.config.location]}-${local.env_map[local.config.environment]}-gen-001"
      intg = "${local.resource_prefixes.resource_group}-${local.location_map[local.config.location]}-${local.env_map[local.config.environment]}-intg-001"
    }
  }
}