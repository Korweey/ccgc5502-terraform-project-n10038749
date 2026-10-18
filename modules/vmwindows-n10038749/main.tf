resource "azurerm_availability_set" "avset" {
  name                         = "${var.name_prefix}-w-avset"
  location                     = var.location
  resource_group_name          = var.rg_name
  platform_fault_domain_count  = var.avs_fault_domains
  platform_update_domain_count = var.avs_update_domains
  managed                      = var.avs_managed
  tags                         = var.tags
}

resource "azurerm_public_ip" "pip" {
  count               = var.vm_count
  name                = "${var.name_prefix}-w-vm${count.index + 1}-pip"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = var.pip_allocation_method
  sku                 = var.pip_sku
  domain_name_label   = "${var.name_prefix}-win-${count.index + 1}"
  tags                = var.tags
}

resource "azurerm_network_interface" "nic" {
  count               = var.vm_count
  name                = "${var.name_prefix}-w-vm${count.index + 1}-nic"
  location            = var.location
  resource_group_name = var.rg_name
  tags                = var.tags

  ip_configuration {
    name                          = var.nic_ip_config_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_allocation
    public_ip_address_id          = azurerm_public_ip.pip[count.index].id
  }
}

resource "azurerm_windows_virtual_machine" "vm" {
  count                 = var.vm_count
  name                  = "${var.name_prefix}-w-vm${count.index + 1}"
  resource_group_name   = var.rg_name
  location              = var.location
  size                  = var.vm_size
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  availability_set_id   = azurerm_availability_set.avset.id
  network_interface_ids = [azurerm_network_interface.nic[count.index].id]
  tags                  = var.tags

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

resource "azurerm_virtual_machine_extension" "antimalware" {
  count                      = var.vm_count
  name                       = "IaaSAntimalware"
  virtual_machine_id         = azurerm_windows_virtual_machine.vm[count.index].id
  publisher                  = "Microsoft.Azure.Security"
  type                       = "IaaSAntimalware"
  type_handler_version       = var.antimalware_version
  auto_upgrade_minor_version = var.ext_auto_upgrade
  tags                       = var.tags

  settings = jsonencode({
    AntimalwareEnabled = true
  })
}
