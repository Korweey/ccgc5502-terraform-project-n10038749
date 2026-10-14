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