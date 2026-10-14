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

output "storage_account_primary_blob_endpoint" {
  description = "Primary blob endpoint of the storage account, used for VM boot diagnostics"
  value       = azurerm_storage_account.sa.primary_blob_endpoint
}