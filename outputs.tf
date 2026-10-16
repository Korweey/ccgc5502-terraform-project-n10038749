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

output "linux_vm_names" {
  description = "Names of the Linux VMs"
  value       = module.vmlinux.vm_names
}

output "linux_public_ips" {
  description = "Public IPs of the Linux VMs"
  value       = module.vmlinux.public_ips
}

output "linux_private_ips" {
  description = "Private IPs of the Linux VMs"
  value       = module.vmlinux.private_ips
}

output "linux_fqdns" {
  description = "FQDNs of the Linux VMs"
  value       = module.vmlinux.fqdns
}

output "windows_vm_names" {
  description = "Names of the Windows VMs"
  value       = module.vmwindows.vm_names
}

output "windows_public_ips" {
  description = "Public IPs of the Windows VMs"
  value       = module.vmwindows.public_ips
}

output "windows_private_ips" {
  description = "Private IPs of the Windows VMs"
  value       = module.vmwindows.private_ips
}

output "windows_fqdns" {
  description = "FQDNs of the Windows VMs"
  value       = module.vmwindows.fqdns
}
output "data_disk_names" {
  description = "Names of the data disks"
  value       = module.datadisk.disk_names
}

output "load_balancer_name" {
  description = "Name of the load balancer"
  value       = module.loadbalancer.lb_name
}

output "load_balancer_public_ip" {
  description = "Public IP of the load balancer"
  value       = module.loadbalancer.lb_public_ip
}

output "load_balancer_fqdn" {
  description = "FQDN of the load balancer"
  value       = module.loadbalancer.lb_fqdn
}

output "database_name" {
  description = "Name of the PostgreSQL server"
  value       = module.database.db_name
}

output "database_fqdn" {
  description = "FQDN of the PostgreSQL server"
  value       = module.database.db_fqdn
}