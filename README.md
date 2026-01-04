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
- **Resource Group Atom**: `app.terraform.io/vpapakir/resourcegroup/atom` v0.0.1
- **Data Factory Atom**: `app.terraform.io/vpapakir/datafactory/azure` (planned)

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
├── main.tf                    # Core infrastructure using atoms
├── variables.tf               # Input variables
├── outputs.tf                 # Resource outputs
├── dev.auto.tfvars           # Auto-loaded dev configuration
├── .azure/pipeline.yml        # Azure DevOps pipeline
└── .github/workflows/         # GitHub Actions workflows
    └── pipeline.yml          # Multi-environment deployment
```

## Pipeline Behavior

### Planning (Every Push)
- **Trigger**: All commits to any branch
- **Execution**: Terraform Cloud remote execution
- **Result**: Shows infrastructure changes, exits successfully
- **No Apply Prompt**: Uses `terraform plan -detailed-exitcode`

### Applying (Intentional Only)
- **Trigger**: Commits containing `[apply]` in message
- **Execution**: Terraform Cloud remote execution
- **Result**: Actually deploys infrastructure changes
- **Dev Environment**: Currently active
- **Staging/Prod**: Disabled (condition: false)

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