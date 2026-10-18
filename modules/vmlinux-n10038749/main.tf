locals {
  linux_vms = {
    "1" = "1"
    "2" = "2"
    "3" = "3"
  }
}

resource "azurerm_public_ip" "pip" {
  for_each            = local.linux_vms
  name                = "${var.name_prefix}-u-vm${each.key}-pip"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = var.pip_allocation_method
  sku                 = var.pip_sku
  zones               = [each.value]
  domain_name_label   = "${var.name_prefix}-linux-${each.key}"
  tags                = var.tags
}

resource "azurerm_network_interface" "nic" {
  for_each            = local.linux_vms
  name                = "${var.name_prefix}-u-vm${each.key}-nic"
  location            = var.location
  resource_group_name = var.rg_name
  tags                = var.tags

  ip_configuration {
    name                          = var.nic_ip_config_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_allocation
    public_ip_address_id          = azurerm_public_ip.pip[each.key].id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each              = local.linux_vms
  name                  = "${var.name_prefix}-u-vm${each.key}"
  resource_group_name   = var.rg_name
  location              = var.location
  size                  = var.vm_size
  admin_username        = var.admin_username
  zone                  = each.value
  network_interface_ids = [azurerm_network_interface.nic[each.key].id]
  tags                  = var.tags

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }

  os_disk {
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_type
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }
}

resource "azurerm_virtual_machine_extension" "network_watcher" {
  for_each                   = local.linux_vms
  name                       = "AzureNetworkWatcherExtension"
  virtual_machine_id         = azurerm_linux_virtual_machine.vm[each.key].id
  publisher                  = "Microsoft.Azure.NetworkWatcher"
  type                       = "NetworkWatcherAgentLinux"
  type_handler_version       = var.network_watcher_version
  auto_upgrade_minor_version = var.ext_auto_upgrade
  tags                       = var.tags
}

resource "azurerm_virtual_machine_extension" "azure_monitor" {
  for_each                   = local.linux_vms
  name                       = "AzureMonitorLinuxAgent"
  virtual_machine_id         = azurerm_linux_virtual_machine.vm[each.key].id
  publisher                  = "Microsoft.Azure.Monitor"
  type                       = "AzureMonitorLinuxAgent"
  type_handler_version       = var.monitor_agent_version
  auto_upgrade_minor_version = var.ext_auto_upgrade
  tags                       = var.tags
}