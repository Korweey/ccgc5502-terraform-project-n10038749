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

variable "subnet_id" {
  description = "Subnet ID for VM NIC attachment"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the Windows VM"
  type        = string
  default     = "azadmin"
}

variable "storage_account_uri" {
  description = "Primary blob endpoint for boot diagnostics"
  type        = string
}

variable "vm_size" {
  description = "VM size for the Windows VM"
  type        = string
  default     = "Standard_F2ads_v7"
}

variable "vm_count" {
  description = "Number of Windows VMs"
  type        = number
  default     = 1
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}

variable "admin_password" {
  description = "Admin password for the Windows VM"
  type        = string
  sensitive   = true
}

variable "image_publisher" {
  description = "Image publisher"
  type        = string
  default     = "MicrosoftWindowsServer"
}

variable "image_offer" {
  description = "Image offer"
  type        = string
  default     = "WindowsServer"
}

variable "image_sku" {
  description = "Image SKU (Gen2 build of Windows Server 2022)"
  type        = string
  default     = "2022-datacenter-g2"
}

variable "image_version" {
  description = "Image version"
  type        = string
  default     = "latest"
}