output "resource_group_name" {
  description = "Name of the created resource group"
  value       = module.rgroup.rg_name
}

output "vnet_name" {
  description = "Name of the virtual network"
  value       = module.network.vnet_name
}

output "subnet_name" {
  description = "Name of the subnet"
  value       = module.network.subnet_name
}

output "log_analytics_workspace_name" {
  description = "Name of the Log Analytics workspace"
  value       = module.common.law_name
}

output "recovery_services_vault_name" {
  description = "Name of the Recovery Services vault"
  value       = module.common.rsv_name
}

output "storage_account_name" {
  description = "Name of the storage account"
  value       = module.common.sa_name
}