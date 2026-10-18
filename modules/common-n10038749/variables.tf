variable "rg_name" {
  description = "Resource group to deploy into"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "law_name" {
  description = "Name of the Log Analytics workspace"
  type        = string
}

variable "rsv_name" {
  description = "Name of the Recovery Services vault"
  type        = string
}

variable "sa_name" {
  description = "Name of the storage account (lowercase, alphanumeric only, globally unique)"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}
variable "law_sku" {
  description = "Log Analytics workspace SKU"
  type        = string
  default     = "PerGB2018"
}

variable "law_retention_days" {
  description = "Log Analytics retention in days"
  type        = number
  default     = 30
}

variable "rsv_sku" {
  description = "Recovery Services vault SKU"
  type        = string
  default     = "Standard"
}

variable "sa_account_tier" {
  description = "Storage account tier"
  type        = string
  default     = "Standard"
}

variable "sa_replication_type" {
  description = "Storage account replication type"
  type        = string
  default     = "LRS"
}
