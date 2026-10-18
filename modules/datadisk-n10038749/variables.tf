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

variable "linux_vm_ids" {
  description = "Linux VM IDs keyed by VM number"
  type        = map(string)
}

variable "linux_vm_zones" {
  description = "Linux VM availability zones keyed by VM number"
  type        = map(string)
}

variable "windows_vm_ids" {
  description = "Windows VM IDs"
  type        = list(string)
}

variable "disk_size_gb" {
  description = "Size of each data disk in GB"
  type        = number
  default     = 10
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}
variable "disk_storage_type" {
  description = "Managed disk storage account type"
  type        = string
  default     = "Standard_LRS"
}

variable "disk_lun" {
  description = "LUN used when attaching data disks"
  type        = number
  default     = 0
}

variable "disk_caching" {
  description = "Caching mode for attached data disks"
  type        = string
  default     = "ReadWrite"
}
