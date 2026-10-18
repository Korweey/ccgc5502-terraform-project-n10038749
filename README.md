# CCGC 5502 Terraform Project (N10038749)

| Name | Student ID |
|------|------------|
| Qawiyy Adebayo Rabiu | N10038749 |
| Saheedat Abbas Olasumbo | N10038753 |
| Course | CCGC 5502 - Automation | 
| Instructor | Prof. Asghar Ghori |

Deploys a complete Azure environment with a root module and 8 child modules, using a remote azurerm backend. A clean run creates exactly 48 resources.

## What gets deployed (eastus)
- Resource group, VNet, subnet, NSG (rules driven by a variable)
- Log Analytics workspace, Recovery Services vault, storage account
- 3 Linux VMs (Ubuntu 24.04, one per availability zone, for_each) with public IPs, a remote-exec provisioner that sets the hostname, and Network Watcher and Azure Monitor extensions
- 1 Windows Server 2022 VM (count) in an availability set with the antimalware extension
- 4 data disks (3 Linux, 1 Windows)
- Standard public load balancer in front of the Linux VMs (HTTP 80)
- PostgreSQL Flexible Server (v16, burstable)

## Layout
- providers.tf, backend.tf, variables.tf, main.tf, outputs.tf (root)
- modules/rgroup-n10038749, network-n10038749, common-n10038749, vmlinux-n10038749, vmwindows-n10038749, datadisk-n10038749, loadbalancer-n10038749, database-n10038749
- Each module: main.tf, variables.tf, outputs.tf (vmlinux and vmwindows also provisioner.tf)

## Prerequisites
- Terraform, Azure CLI, an SSH key pair at ~/.ssh/id_rsa and ~/.ssh/id_rsa.pub
- az login to the subscription that will host the resources

## Secrets (never committed)
Sensitive values are read from environment variables, not files:
- TF_VAR_windows_admin_password : Windows VM admin password
- TF_VAR_db_admin_password : PostgreSQL admin password
- ARM_ACCESS_KEY : access key for the remote-state storage account

## Remote backend
State is stored in Azure Storage, created outside Terraform:
- Resource group n10038749-tfstate-rg, storage account n10038749prjstate, container tfstate, key project.terraform.tfstate
- These are not managed by this configuration, so terraform destroy does not remove them.

## Run
    terraform init
    terraform validate
    terraform apply --auto-approve
    terraform state list | nl     # 48 resources
    terraform output
    terraform destroy --auto-approve

## Parameterization
All module settings are variables with defaults. The most useful ones are exposed at the root (variables.tf): VM sizes and counts, image publisher/offer/sku, VNet and subnet CIDRs, disk size, database version/SKU/storage/retention, load balancer SKU and ports, Log Analytics retention. Common tags are built once in locals and passed to every module. NSG rules are a single list variable consumed by a dynamic block.

## Design decisions
- Region eastus: it has availability zones and the needed VM SKUs are unrestricted on the subscription (Canada Central had B1s/B2s/D2s_v3 blocked).
- Load balancer uses the Standard SKU: Basic was retired by Azure on 30 Sep 2025 and cannot front zonal VMs.
- Linux VMs use for_each (keyed by zone); the Windows VM uses count; the hostname provisioner uses terraform_data so it adds no extra provider.
- Passwords are supplied as sensitive variables rather than generated in Terraform, which keeps the state at exactly 48 resources.

## Problems found and fixed
- Recovery Services vault: soft_delete_enabled cannot be set to false, so the argument was removed.
- Duplicate output definition in the network module: removed the extra block.
- Azure login blocked by Entra security defaults (AADSTS530035): logged in with az login --tenant using a browser session.
- VM SKUs unavailable in Canada Central: moved the project to eastus and F-series sizes.
- v7 VM sizes cannot boot older images (NVMe disk controller): replaced CentOS 8.2 with Ubuntu 24.04 and used Gen2 Windows image.
- Public IP DNS label containing the word "windows" is rejected as a reserved word: renamed to -win-.
- Network Watcher extension type_handler_version corrected.
