# YAML Configuration
locals {
  # Load environment-specific YAML config
  config = yamldecode(file("${path.module}/config/${terraform.workspace == "azure-infra-dev" ? "dev" : "dev"}.yaml"))

  # Process resource groups from YAML with naming convention
  resource_groups = {
    for rg in local.config.resource_groups : rg.purpose => {
      name     = "${local.resource_prefixes.resource_group}-${local.location_map[local.config.location]}-${local.env_map[local.config.environment]}-${rg.purpose}-${format("%03d", rg.instance)}"
      location = local.config.location
      tags     = merge(local.config.common_tags, rg.tags)
    }
  }
}