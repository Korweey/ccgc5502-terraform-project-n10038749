resource "terraform_data" "linux_hostname" {
  for_each = local.linux_vms

  triggers_replace = [azurerm_linux_virtual_machine.vm[each.key].id]

  depends_on = [
    azurerm_virtual_machine_extension.network_watcher,
    azurerm_virtual_machine_extension.azure_monitor
  ]

  connection {
    type        = "ssh"
    host        = azurerm_public_ip.pip[each.key].ip_address
    user        = var.admin_username
    private_key = file(var.ssh_private_key_path)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo hostnamectl set-hostname ${var.name_prefix}-u-vm${each.key}",
      "hostname"
    ]
  }
}