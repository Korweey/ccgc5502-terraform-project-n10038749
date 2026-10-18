resource "azurerm_public_ip" "lb" {
  name                = "${var.name_prefix}-LB-pip"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = var.lb_pip_allocation
  sku                 = var.sku
  domain_name_label   = "${var.name_prefix}-lb"
  tags                = var.tags
}

resource "azurerm_lb" "lb" {
  name                = "${var.name_prefix}-LB"
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.sku
  tags                = var.tags

  frontend_ip_configuration {
    name                 = var.frontend_name
    public_ip_address_id = azurerm_public_ip.lb.id
  }
}

resource "azurerm_lb_backend_address_pool" "pool" {
  name            = var.backend_pool_name
  loadbalancer_id = azurerm_lb.lb.id
}

resource "azurerm_lb_probe" "http" {
  name            = var.probe_name
  loadbalancer_id = azurerm_lb.lb.id
  protocol        = var.probe_protocol
  port            = var.probe_port
}

resource "azurerm_lb_rule" "http" {
  name                           = var.rule_name
  loadbalancer_id                = azurerm_lb.lb.id
  protocol                       = var.rule_protocol
  frontend_port                  = var.frontend_port
  backend_port                   = var.backend_port
  frontend_ip_configuration_name = var.frontend_name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.pool.id]
  probe_id                       = azurerm_lb_probe.http.id
}

resource "azurerm_network_interface_backend_address_pool_association" "linux" {
  for_each                = var.linux_nic_ids
  network_interface_id    = each.value
  ip_configuration_name   = var.nic_ip_config_name
  backend_address_pool_id = azurerm_lb_backend_address_pool.pool.id
}