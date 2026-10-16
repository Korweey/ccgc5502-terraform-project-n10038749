locals {
  common_tags = {
    Project        = var.project_tag
    Name           = var.owner_name
    ExpirationDate = "2027-12-31"
    Environment    = var.environment
  }
}

module "rgroup" {
  source   = "./modules/rgroup-n10038749"
  rg_name  = "${var.humber_id}-RG"
  location = var.location
  tags     = local.common_tags
}

module "network" {
  source      = "./modules/network-n10038749"
  rg_name     = module.rgroup.rg_name
  location    = var.location
  vnet_name   = "${var.humber_id}-VNET"
  subnet_name = "${var.humber_id}-SUBNET"
  nsg_name    = "${var.humber_id}-NSG"
  tags        = local.common_tags
}

module "common" {
  source   = "./modules/common-n10038749"
  rg_name  = module.rgroup.rg_name
  location = var.location
  law_name = "${var.humber_id}-LAW"
  rsv_name = "${var.humber_id}-RSV"
  sa_name  = "${var.humber_id}sa"
  tags     = local.common_tags
}

module "vmlinux" {
  source                = "./modules/vmlinux-n10038749"
  rg_name                = module.rgroup.rg_name
  location               = var.location
  name_prefix            = var.humber_id
  subnet_id              = module.network.subnet_id
  admin_username         = var.admin_username
  ssh_public_key         = file(pathexpand(var.ssh_public_key_path))
  ssh_private_key_path   = pathexpand(var.ssh_private_key_path)
  storage_account_uri    = module.common.storage_account_primary_blob_endpoint
  tags                   = local.common_tags
}

module "vmwindows" {
  source              = "./modules/vmwindows-n10038749"
  rg_name             = module.rgroup.rg_name
  location            = var.location
  name_prefix         = var.humber_id
  subnet_id           = module.network.subnet_id
  admin_username      = var.admin_username
  storage_account_uri = module.common.storage_account_primary_blob_endpoint
  tags                = local.common_tags
}

module "datadisk" {
  source         = "./modules/datadisk-n10038749"
  rg_name        = module.rgroup.rg_name
  location       = var.location
  name_prefix    = var.humber_id
  linux_vm_ids   = module.vmlinux.vm_ids
  linux_vm_zones = module.vmlinux.vm_zones
  windows_vm_ids = module.vmwindows.vm_ids
  tags           = local.common_tags
}