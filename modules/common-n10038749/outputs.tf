output "law_name" {
  description = "Name of the Log Analytics workspace"
  value       = azurerm_log_analytics_workspace.law.name
}

output "rsv_name" {
  description = "Name of the Recovery Services vault"
  value       = azurerm_recovery_services_vault.rsv.name
}

output "sa_name" {
  description = "Name of the storage account"
  value       = azurerm_storage_account.sa.name
}