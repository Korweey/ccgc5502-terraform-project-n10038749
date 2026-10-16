output "db_name" {
  description = "Name of the PostgreSQL server"
  value       = azurerm_postgresql_flexible_server.db.name
}

output "db_fqdn" {
  description = "FQDN of the PostgreSQL server"
  value       = azurerm_postgresql_flexible_server.db.fqdn
}