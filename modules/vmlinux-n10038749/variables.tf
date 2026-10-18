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