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
  source          = "./modules/network-n10038749"
  address_space   = var.vnet_address_space
  subnet_prefixes = var.subnet_prefixes
  rg_name         = module.rgroup.rg_name
  location        = var.location
  vnet_name       = "${var.humber_id}-VNET"
  subnet_name     = "${var.humber_id}-SUBNET"
  nsg_name        = "${var.humber_id}-NSG"
  tags            = local.common_tags
}

module "common" {
  source             = "./modules/common-n10038749"
  law_retention_days = var.law_retention_days
  rg_name            = module.rgroup.rg_name
  location           = var.location
  law_name           = "${var.humber_id}-LAW"
  rsv_name           = "${var.humber_id}-RSV"
  sa_name            = "${var.humber_id}sa"
  tags               = local.common_tags
}

module "vmlinux" {
  source               = "./modules/vmlinux-n10038749"
  vm_size              = var.linux_vm_size
  image_publisher      = var.linux_image_publisher
  image_offer          = var.linux_image_offer
  image_sku            = var.linux_image_sku
  rg_name              = module.rgroup.rg_name
  location             = var.location
  name_prefix          = var.humber_id
  subnet_id            = module.network.subnet_id
  admin_username       = var.admin_username
  ssh_public_key       = file(pathexpand(var.ssh_public_key_path))
  ssh_private_key_path = pathexpand(var.ssh_private_key_path)
  storage_account_uri  = module.common.storage_account_primary_blob_endpoint
  tags                 = local.common_tags
}

module "vmwindows" {
  source              = "./modules/vmwindows-n10038749"
  vm_size             = var.windows_vm_size
  vm_count            = var.windows_vm_count
  image_publisher     = var.windows_image_publisher
  image_offer         = var.windows_image_offer
  image_sku           = var.windows_image_sku
  rg_name             = module.rgroup.rg_name
  location            = var.location
  name_prefix         = var.humber_id
  subnet_id           = module.network.subnet_id
  admin_username      = var.admin_username
  storage_account_uri = module.common.storage_account_primary_blob_endpoint
  tags                = local.common_tags
  admin_password      = var.windows_admin_password
}

module "datadisk" {
  source         = "./modules/datadisk-n10038749"
  disk_size_gb   = var.data_disk_size_gb
  rg_name        = module.rgroup.rg_name
  location       = var.location
  name_prefix    = var.humber_id
  linux_vm_ids   = module.vmlinux.vm_ids
  linux_vm_zones = module.vmlinux.vm_zones
  windows_vm_ids = module.vmwindows.vm_ids
  tags           = local.common_tags
}

module "loadbalancer" {
  source        = "./modules/loadbalancer-n10038749"
  sku           = var.lb_sku
  probe_port    = var.lb_probe_port
  frontend_port = var.lb_frontend_port
  backend_port  = var.lb_backend_port
  rg_name       = module.rgroup.rg_name
  location      = var.location
  name_prefix   = var.humber_id
  linux_nic_ids = module.vmlinux.nic_ids
  tags          = local.common_tags
}

module "database" {
  source                = "./modules/database-n10038749"
  pg_version            = var.db_pg_version
  sku_name              = var.db_sku_name
  storage_mb            = var.db_storage_mb
  backup_retention_days = var.db_backup_retention_days
  rg_name               = module.rgroup.rg_name
  location              = var.db_location
  name_prefix           = var.humber_id
  admin_password        = var.db_admin_password
  tags                  = local.common_tags
}