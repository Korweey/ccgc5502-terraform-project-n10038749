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