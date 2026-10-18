resource "azurerm_managed_disk" "linux" {
  for_each             = var.linux_vm_ids
  name                 = "${var.name_prefix}-u-vm${each.key}-disk1"
  location             = var.location
  resource_group_name  = var.rg_name
  storage_account_type = var.disk_storage_type
  create_option        = "Empty"
  disk_size_gb         = var.disk_size_gb
  zone                 = var.linux_vm_zones[each.key]
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "linux" {
  for_each           = var.linux_vm_ids
  managed_disk_id    = azurerm_managed_disk.linux[each.key].id
  virtual_machine_id = each.value
  lun                = var.disk_lun
  caching            = var.disk_caching
}

resource "azurerm_managed_disk" "windows" {
  count                = length(var.windows_vm_ids)
  name                 = "${var.name_prefix}-w-vm${count.index + 1}-disk1"
  location             = var.location
  resource_group_name  = var.rg_name
  storage_account_type = var.disk_storage_type
  create_option        = "Empty"
  disk_size_gb         = var.disk_size_gb
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "windows" {
  count              = length(var.windows_vm_ids)
  managed_disk_id    = azurerm_managed_disk.windows[count.index].id
  virtual_machine_id = var.windows_vm_ids[count.index]
  lun                = var.disk_lun
  caching            = var.disk_caching
}