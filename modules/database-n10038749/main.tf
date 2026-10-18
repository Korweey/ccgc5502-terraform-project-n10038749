resource "azurerm_postgresql_flexible_server" "db" {
  name                          = "${var.name_prefix}-psql"
  resource_group_name           = var.rg_name
  location                      = var.location
  version                       = var.pg_version
  administrator_login           = var.admin_username
  administrator_password        = var.admin_password
  sku_name                      = var.sku_name
  storage_mb                    = var.storage_mb
  backup_retention_days         = var.backup_retention_days
  public_network_access_enabled = var.public_network_access_enabled
  tags                          = var.tags
}