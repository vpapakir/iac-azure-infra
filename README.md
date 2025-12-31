# iac-azure-infra

Azure infrastructure consumer repository implementing multi-environment deployment using published atoms from the atom-molecule-template architecture...

## Traffic Light System

This repository implements the **traffic light system** for CI/CD pipeline control using structured commit messages.

### Commit Message Convention

```
[github] [azure] [ci-tool] [action] <description>
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
- **Resource Group Atom**: `app.terraform.io/vpapakir/resourcegroup/azure`
- **Data Factory Atom**: `app.terraform.io/vpapakir/datafactory/azure` (when available)

## Multi-Environment Structure

```
iac-azure-infra/
├── main.tf                    # Core infrastructure using atoms
├── variables.tf               # Input variables
├── outputs.tf                 # Resource outputs
├── environments/              # Environment-specific configurations
│   ├── dev.tfvars            # Development settings
│   ├── staging.tfvars        # Staging settings
│   └── prod.tfvars           # Production settings
├── backend-configs/           # Terraform Cloud workspace configs
│   ├── dev.hcl               # Dev workspace
│   ├── staging.hcl           # Staging workspace
│   └── prod.hcl              # Production workspace
├── .azure/pipeline.yml        # Azure DevOps multi-stage pipeline
└── .github/workflows/         # GitHub Actions workflows
    └── pipeline.yml          # Multi-environment deployment
```

## Pipeline Stages

### Development
- **Trigger**: All commits and PRs
- **Environment**: `dev`
- **Workspace**: `azure-infra-dev`
- **Auto-deploy**: Yes

### Staging
- **Trigger**: Main branch only
- **Environment**: `staging`
- **Workspace**: `azure-infra-staging`
- **Depends on**: Dev deployment success

### Production
- **Trigger**: Main branch only
- **Environment**: `production`
- **Workspace**: `azure-infra-prod`
- **Depends on**: Staging deployment success
- **Requires**: Manual approval

## Pipeline Stages

### Planning (All Environments)
- **Trigger**: Every push
- **Environments**: Dev, staging, prod
- **Shows**: What would change in each environment

### Apply Rules
- **Dev**: Any branch with `[apply]`
- **Staging/Prod**: Main branch only with `[apply]`
- **Requires**: Manual approval for production

## Usage

### Planning Changes (Every Push)
```bash
# Plan infrastructure changes
git commit -m "[github] [azure] [ado] feat: update resource group configuration"
git push origin feature-branch
```
**Result**: Pipeline runs plan stage only, shows what would change

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

### Development (`environments/dev.tfvars`)
- Public network access enabled
- Basic security settings
- Cost-optimized resources

### Staging (`environments/staging.tfvars`)
- Private network access
- Production-like security
- Scaled-down resources

### Production (`environments/prod.tfvars`)
- Private network access
- Maximum security hardening
- Full-scale resources

## Required Secrets

### Azure DevOps Variable Groups
**`terraform` Variable Group:**
- `apiKey` - Terraform Cloud API token

**`shared` Variable Group:**
- `ARM_CLIENT_ID` - Azure Service Principal ID
- `ARM_CLIENT_SECRET` - Azure Service Principal Secret
- `ARM_SUBSCRIPTION_ID` - Azure Subscription ID
- `ARM_TENANT_ID` - Azure Tenant ID

### GitHub Actions Secrets
- `TF_CLOUD_TOKEN` - Terraform Cloud API token
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