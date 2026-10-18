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
variable "avs_fault_domains" {
  description = "Availability set platform fault domain count"
  type        = number
  default     = 2
}

variable "avs_update_domains" {
  description = "Availability set platform update domain count"
  type        = number
  default     = 2
}

variable "avs_managed" {
  description = "Whether the availability set is managed"
  type        = bool
  default     = true
}

variable "pip_allocation_method" {
  description = "Public IP allocation method"
  type        = string
  default     = "Static"
}

variable "pip_sku" {
  description = "Public IP SKU"
  type        = string
  default     = "Standard"
}

variable "nic_ip_config_name" {
  description = "NIC IP configuration name"
  type        = string
  default     = "internal"
}

variable "private_ip_allocation" {
  description = "Private IP allocation method"
  type        = string
  default     = "Dynamic"
}

variable "os_disk_caching" {
  description = "OS disk caching mode"
  type        = string
  default     = "ReadWrite"
}

variable "os_disk_storage_type" {
  description = "OS disk storage account type"
  type        = string
  default     = "Standard_LRS"
}

variable "antimalware_version" {
  description = "IaaSAntimalware extension type handler version"
  type        = string
  default     = "1.3"
}

variable "ext_auto_upgrade" {
  description = "Auto-upgrade minor version for extensions"
  type        = bool
  default     = true
}
