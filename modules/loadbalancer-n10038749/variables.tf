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