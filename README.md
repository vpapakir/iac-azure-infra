# iac-azure-infra

Azure infrastructure consumer repository implementing multi-environment deployment using published atoms from the atom-molecule-template architecture.

## Traffic Light System

This repository implements the **traffic light system** for CI/CD pipeline control using structured commit messages.

### Commit Message Convention

```
[github] [azure] [ci-tool] [action] <description-free-text-here>
```

**Examples:**
```bash
# Deploy using Azure DevOps
git commit -m "[github] [azure] [ado] [build] feat: update resource group configuration"

# Deploy using GitHub Actions
git commit -m "[github] [azure] [gh_actions] [build] feat: add data factory module"
```

## Architecture

This repository consumes published atoms from Terraform Cloud registry:
- **Resource Group Atom**: `app.terraform.io/vpapakir/resourcegroup/atom` v0.0.2
- **Data Factory Atom**: `app.terraform.io/vpapakir/datafactory/azure` (planned)

### YAML-Driven Configuration
- **Configuration**: Defined in `config/dev.yaml` with structured data
- **Naming Convention**: Strict Azure CAF compliant naming (`rg-weu-dev-{purpose}-001`)
- **Resource Processing**: YAML decoded with `yamldecode()` and processed through Terraform locals
- **Tag Merging**: Common tags merged with resource-specific tags

### Current Resource Groups (8 total)
- `rg-weu-dev-gen-001` - General resources
- `rg-weu-dev-shared-001` - Shared infrastructure
- `rg-weu-dev-api-001` - API services
- `rg-weu-dev-sqldb-001` - SQL databases
- `rg-weu-dev-dataintg-001` - Data integration
- `rg-weu-dev-datalake-001` - Data lake
- `rg-weu-dev-datalakestorage-001` - Data lake storage
- `rg-weu-dev-manageddbx-001` - Managed Databricks

### Execution Model
- **Remote Execution**: Terraform runs in Terraform Cloud
- **Remote State**: State stored in Terraform Cloud workspaces
- **VCS Integration**: Repository connected to Terraform Cloud for automatic runs
- **Authentication**: Azure credentials configured in Terraform Cloud workspace variables

## Multi-Environment Structure

```
iac-azure-infra/
├── backend.tf                 # Terraform Cloud remote backend
├── providers.tf               # Azure provider configuration
├── 01.main-gen.tf             # General resource group
├── 02.main-intg.tf            # Integration resource group
├── imports.tf                 # Resource import blocks
├── variables.tf               # Input variables
├── outputs.tf                 # Resource outputs
├── config/
│   └── dev.yaml               # YAML configuration with resource definitions
├── naming.tf                  # Naming convention system
├── config.tf                  # YAML processing with yamldecode()
├── .azure/pipeline.yml        # Azure DevOps pipeline
└── .github/workflows/         # GitHub Actions workflows
    └── pipeline.yml          # Multi-environment deployment
```

## Pipeline Configuration

### Centralized Pipeline Templates
Pipeline templates are sourced from the centralized `iac-pipeline-templates` repository:
- **Template Repository**: https://github.com/vpapakir/iac-pipeline-templates
- **Current Version**: Latest release
- **Infrastructure-Specific**: Optimized for infrastructure consumption patterns

### Azure DevOps (`.azure/pipeline.yml`)
- **Template**: `azure/stages/infrastructure-pipeline.yml@templates`
- **Parameters**: ciTool: 'ado', workspacePrefix: 'azure-infra', terraformVersion: '1.14.0'
- **Variable Groups**: `terraform` (TF_CLOUD_TOKEN), `shared` (Azure credentials)
- **Stages**: CommitCheck → Plan → Apply

### GitHub Actions (`.github/workflows/pipeline.yml`)
- **Workflow**: `vpapakir/iac-pipeline-templates/.github/workflows/infrastructure-pipeline.yml@main`
- **Inputs**: ci-tool: 'gh_actions', workspace-prefix: 'azure-infra'
- **Secrets**: `TF_CLOUD_TOKEN`
- **Jobs**: commit-check → plan → apply

## Usage

### Planning Changes (Every Push)
```bash
# Plan infrastructure changes
git commit -m "[github] [azure] [ado] feat: update resource group configuration"
git push origin feature-branch
```
**Result**: Pipeline runs plan stage only and shows what would change..

### Applying Changes (Intentional)
```bash
# Apply infrastructure changes
git commit -m "[github] [azure] [ado] [apply] feat: deploy resource group updates"
git push origin feature-branch
```
**Result**: Pipeline runs plan + apply stages

### Environment Promotion
```bash
# Apply to all environments (main branch)
git commit -m "[github] [azure] [ado] [apply] feat: production deployment"
git push origin main
```
**Result**: Applies to dev → staging → prod

## Environment Configuration

### Development (`dev.auto.tfvars`)
- **General RG**: `rg-weu-dev-gen-001` in West Europe
- **Integration RG**: `rg-weu-dev-intg-001` in West Europe
- Auto-loaded by Terraform Cloud remote execution
- Environment: dev, Project: gen/intg, Owner: platform team

## Outputs

The infrastructure exposes hierarchical outputs for easy consumption:

```hcl
# Individual resource group outputs
output "gen" {
  value = {
    id       = "resource-group-id"
    name     = "rg-weu-dev-gen-001"
    location = "West Europe"
  }
}

output "intg" {
  value = {
    id       = "resource-group-id"
    name     = "rg-weu-dev-intg-001"
    location = "West Europe"
  }
}

# Cross-reference helper for other modules
output "resource_groups" {
  value = {
    gen  = { id = "...", name = "...", location = "..." }
    intg = { id = "...", name = "...", location = "..." }
  }
}
```

**Usage in other modules:**
```hcl
# Reference specific resource group
resource_group_name = data.terraform_remote_state.infra.outputs.gen.name
location = data.terraform_remote_state.infra.outputs.intg.location

# Use cross-reference helper
resource_group_id = data.terraform_remote_state.infra.outputs.resource_groups.gen.id
```

## Required Configuration

### Terraform Cloud Workspace
**Workspace**: `azure-infra-dev`
**VCS Connection**: Connected to GitHub repository
**Environment Variables**:
- `ARM_CLIENT_ID` - Azure Service Principal ID
- `ARM_CLIENT_SECRET` - Azure Service Principal Secret (sensitive)
- `ARM_SUBSCRIPTION_ID` - Azure Subscription ID
- `ARM_TENANT_ID` - Azure Tenant ID

### Azure DevOps Variable Groups
**`terraform` Variable Group:**
- `apiKey` - Terraform Cloud API token

**`shared` Variable Group:**
- `ARM_CLIENT_ID` - Azure Service Principal ID
- `ARM_CLIENT_SECRET` - Azure Service Principal Secret
- `ARM_SUBSCRIPTION_ID` - Azure Subscription ID
- `ARM_TENANT_ID` - Azure Tenant ID

## Contributing

1. **Follow traffic light system** - Use appropriate commit message format
2. **Test in dev first** - All changes deploy to dev automatically
3. **Use feature branches** - Create PRs for main branch changes
4. **Environment promotion** - Changes flow dev → staging → prod
5. **Production approval** - Production deployments require manual approval

## License

See [LICENSE](LICENSE) file for details.