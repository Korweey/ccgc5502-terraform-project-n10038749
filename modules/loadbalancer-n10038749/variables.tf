variable "rg_name" {
  description = "Resource group to deploy into"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for resource names (Humber ID)"
  type        = string
}

variable "sku" {
  description = "Load balancer SKU (Basic was retired by Azure; Standard is required for zonal backends)"
  type        = string
  default     = "Standard"
}

variable "linux_nic_ids" {
  description = "Linux VM NIC IDs keyed by VM number"
  type        = map(string)
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}
variable "lb_pip_allocation" {
  description = "Load balancer public IP allocation method"
  type        = string
  default     = "Static"
}

variable "frontend_name" {
  description = "Frontend IP configuration name"
  type        = string
  default     = "frontend"
}

variable "backend_pool_name" {
  description = "Backend address pool name"
  type        = string
  default     = "linux-backend-pool"
}

variable "probe_name" {
  description = "Health probe name"
  type        = string
  default     = "http-probe"
}

variable "probe_protocol" {
  description = "Health probe protocol"
  type        = string
  default     = "Tcp"
}

variable "probe_port" {
  description = "Health probe port"
  type        = number
  default     = 80
}

variable "rule_name" {
  description = "Load balancing rule name"
  type        = string
  default     = "http-rule"
}

variable "rule_protocol" {
  description = "Load balancing rule protocol"
  type        = string
  default     = "Tcp"
}

variable "frontend_port" {
  description = "Load balancing rule frontend port"
  type        = number
  default     = 80
}

variable "backend_port" {
  description = "Load balancing rule backend port"
  type        = number
  default     = 80
}

variable "nic_ip_config_name" {
  description = "NIC IP configuration name used for pool association"
  type        = string
  default     = "internal"
}
