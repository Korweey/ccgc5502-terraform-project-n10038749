output "disk_names" {
  description = "Names of all data disks"
  value = concat(
    [for k, v in azurerm_managed_disk.linux : v.name],
    azurerm_managed_disk.windows[*].name
  )
}