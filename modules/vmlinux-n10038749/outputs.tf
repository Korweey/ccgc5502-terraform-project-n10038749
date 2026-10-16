output "vm_names" {
  description = "Names of the Linux VMs"
  value       = [for k, v in azurerm_linux_virtual_machine.vm : v.name]
}

output "public_ips" {
  description = "Public IP addresses of the Linux VMs, keyed by VM number"
  value       = { for k, v in azurerm_public_ip.pip : k => v.ip_address }
}

output "private_ips" {
  description = "Private IP addresses of the Linux VMs, keyed by VM number"
  value       = { for k, v in azurerm_network_interface.nic : k => v.private_ip_address }
}

output "fqdns" {
  description = "Fully qualified domain names of the Linux VMs, keyed by VM number"
  value       = { for k, v in azurerm_public_ip.pip : k => v.fqdn }
}

output "vm_ids" {
  description = "IDs of the Linux VMs, keyed by VM number"
  value       = { for k, v in azurerm_linux_virtual_machine.vm : k => v.id }
}

output "vm_zones" {
  description = "Availability zones of the Linux VMs, keyed by VM number"
  value       = { for k, v in azurerm_linux_virtual_machine.vm : k => v.zone }
}