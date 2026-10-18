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
  description = "Admin username for SSH login"
  type        = string
  default     = "azadmin"
}

variable "ssh_public_key" {
  description = "SSH public key content for VM login"
  type        = string
}

variable "ssh_private_key_path" {
  description = "Path to the SSH private key used by the hostname provisioner"
  type        = string
}

variable "storage_account_uri" {
  description = "Primary blob endpoint for boot diagnostics"
  type        = string
}

variable "vm_size" {
  description = "VM size for the Linux VMs"
  type        = string
  default     = "Standard_F1ads_v7"
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}

variable "image_publisher" {
  description = "Image publisher"
  type        = string
  default     = "Canonical"
}

variable "image_offer" {
  description = "Image offer"
  type        = string
  default     = "ubuntu-24_04-lts"
}

variable "image_sku" {
  description = "Image SKU (Ubuntu 24.04 LTS (NVMe-capable, Gen2))"
  type        = string
  default     = "server"
}

variable "image_version" {
  description = "Image version"
  type        = string
  default     = "latest"
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

variable "network_watcher_version" {
  description = "Network Watcher extension type handler version"
  type        = string
  default     = "1.0"
}

variable "monitor_agent_version" {
  description = "Azure Monitor agent extension type handler version"
  type        = string
  default     = "1.0"
}

variable "ext_auto_upgrade" {
  description = "Auto-upgrade minor version for extensions"
  type        = bool
  default     = true
}
