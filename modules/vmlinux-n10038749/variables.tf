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
  default     = "Standard_B1s"
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}