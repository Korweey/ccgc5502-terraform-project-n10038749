output "vm_names" {
  description = "Names of the Windows VMs"
  value       = azurerm_windows_virtual_machine.vm[*].name
}

output "public_ips" {
  description = "Public IPs of the Windows VMs"
  value       = azurerm_public_ip.pip[*].ip_address
}

output "private_ips" {
  description = "Private IPs of the Windows VMs"
  value       = azurerm_network_interface.nic[*].private_ip_address
}

output "fqdns" {
  description = "FQDNs of the Windows VMs"
  value       = azurerm_public_ip.pip[*].fqdn
}

output "vm_ids" {
  description = "IDs of the Windows VMs"
  value       = azurerm_windows_virtual_machine.vm[*].id
}